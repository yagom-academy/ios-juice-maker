//
//  JuiceMaker - MainViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class MainViewController: UIViewController {
    @objc let store = FruitStore(stockCount: 10)
    private lazy var juiceMaker = JuiceMaker(store: store)
    
    private var stockChangeObserver: NSKeyValueObservation?
    
    @IBOutlet weak var strawberryBananaOrder: UIButton!
    @IBOutlet weak var mangoKiwiOrder: UIButton!
    @IBOutlet weak var strawberryOrder: UIButton!
    @IBOutlet weak var bananaOrder: UIButton!
    @IBOutlet weak var pineappleOrder: UIButton!
    @IBOutlet weak var kiwiOrder: UIButton!
    @IBOutlet weak var mangoOrder: UIButton!
    @IBOutlet var fruitCountLabelArray: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockChangeObserver = observe(\.store.stock,
                                       options: [.new, .initial],
                                       changeHandler: { (object, stock) in
            guard let newStock = stock.newValue else { return }
            self.updateStockCount(stock: newStock)
        })
    }
    
    @IBAction private func tappedModifyBarButton(_ sender: Any) {
        guard let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "EditNavigationController") as? UINavigationController else { return }
        navigationController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        navigationController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        StockStorage.shared.stock = store.stock
        
        present(navigationController, animated: true)
    }
    
    @IBAction private func tappedOrderButton(_ sender: UIButton) {
        var juice: Juice?
        
        switch sender {
        case strawberryBananaOrder:
            juice = .strawberryBananaJuice
        case mangoKiwiOrder:
            juice = .mangoKiwiJuice
        case strawberryOrder:
            juice = .strawberryJuice
        case bananaOrder:
            juice = .bananaJuice
        case pineappleOrder:
            juice = .pineappleJuice
        case kiwiOrder:
            juice = .kiwiJuice
        case mangoOrder:
            juice = .mangoKiwiJuice
        default:
            juice = nil
        }
        
        checkCanMakeJuice(juice)
    }
    
    private func checkCanMakeJuice(_ juice: Juice?) {
        guard let juice = juice else { return }
        
        if juiceMaker.makeJuice(juice) {
            self.madeJuiceAlert(message: juice.name)
        } else {
            self.failedAlert()
        }
    }
    
    private func madeJuiceAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: "\(message) 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func failedAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예",
                                      style: .default,
                                      handler: { _ in
            self.tappedModifyBarButton(())
        })
        let noAction = UIAlertAction(title: "아니오",
                                     style: .destructive,
                                     handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    private func updateStockCount(stock: [Int]) {
        var newStock = stock
        
        for fruitCountLabel in fruitCountLabelArray {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
}
