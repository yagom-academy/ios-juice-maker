//
//  JuiceMaker - MainViewController.swift
//  Created by Wonbi, woong
//

import UIKit

extension NSNotification.Name {
    static let changedStockCount = NSNotification.Name("changedStockCount")
    static let madeJuiceAlert = NSNotification.Name("madeJuiceAlert")
    static let failedAlert = NSNotification.Name("failedAlert")
}

class MainViewController: UIViewController {
    let store = FruitStore(stockCount: 10)
    private lazy var juiceMaker = JuiceMaker(store: store)
    
    private var stockChangeObserver: NSKeyValueObservation?
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockChangeObserver = store.observe(\.stock,
                                             options: [.new, .initial],
                                             changeHandler: { (object, stock) in
            guard let newStock = stock.newValue else { return }
            self.updateStockCount(stock: newStock)
        })
    }
    
    @IBAction private func tappedModifyBarButton(_ sender: UIBarButtonItem) {
        guard let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "EditNavigationController") as? UINavigationController else { return }
        guard let viewController = navigationController.viewControllers.first as? EditViewController else { return }
        navigationController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        viewController.stock = store.stock
        
        present(navigationController, animated: true)
    }
    
    @IBAction private func tappedOrderButton(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else { return }
        let juiceName = buttonText.replacingOccurrences(of: " 주문", with: "")
        guard let juice = Juice(rawValue: juiceName) else { return }
        
        juiceMaker.makeJuice(juice)
    }
    
    private func madeJuiceAlert(_ noti: Notification) {
        guard let juiceName = noti.userInfo?["JuiceName"] else { return }
        
        let alert = UIAlertController(title: nil,
                                      message: "\(juiceName) 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func failedAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: { ACTION in
            self.tappedModifyBarButton(UIBarButtonItem())
        })
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    private func updateStockCount(stock: [Int]) {
        strawberryCountLabel.text = String(stock[Fruit.strawberry.index])
        bananaCountLabel.text = String(stock[Fruit.banana.index])
        pineappleCountLabel.text = String(stock[Fruit.pineapple.index])
        kiwiCountLabel.text = String(stock[Fruit.kiwi.index])
        mangoCountLabel.text = String(stock[Fruit.mango.index])
    }
}
