//
//  JuiceMaker - MainViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class MainViewController: UIViewController {
    let store = FruitStore(stockCount: 10)
    private lazy var juiceMaker = JuiceMaker(store: store)
    
    @IBOutlet weak var strawberryBananaOrder: UIButton!
    @IBOutlet weak var mangoKiwiOrder: UIButton!
    @IBOutlet weak var strawberryOrder: UIButton!
    @IBOutlet weak var bananaOrder: UIButton!
    @IBOutlet weak var pineappleOrder: UIButton!
    @IBOutlet weak var kiwiOrder: UIButton!
    @IBOutlet weak var mangoOrder: UIButton!
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateStockCount()
    }
    
    @IBAction private func tappedModifyBarButton(_ sender: Any) {
        guard let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "EditNavigationController") as? UINavigationController else { return }
        navigationController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        navigationController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        guard let editViewController = navigationController.viewControllers.first as? EditViewController else { return }
        editViewController.setStore(from: store)
        
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
            updateStockCount()
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
    
    private func updateStockCount() {
        var newStock = store.stock
        
        for fruitCountLabel in fruitCountLabels {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
}
