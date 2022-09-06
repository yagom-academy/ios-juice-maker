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
    private let store = FruitStore(stockCount: 10)
    lazy var juiceMaker = JuiceMaker(store: store)
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateStockCount(_:)),
                                               name: .changedStockCount,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(madeJuiceAlert(_:)),
                                               name: .madeJuiceAlert,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(failedAlert(_:)),
                                               name: .failedAlert,
                                               object: nil)
        
        NotificationCenter.default.post(name: .changedStockCount,
                                        object: nil,
                                        userInfo: nil)
    }
    
    @IBAction func tappedModifyBarButton(_ sender: UIBarButtonItem) {
        guard let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "EditNavigationController") as? UINavigationController else { return }
        guard let viewController = navigationController.viewControllers.first as? EditViewController else { return }
        navigationController.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        viewController.stock = store.stock
        
        present(navigationController, animated: true)
    }
    
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.restorationIdentifier else { return }
        guard let juice = Juice(rawValue: juiceName) else { return }
        
        juiceMaker.makeJuice(juice)
    }
    
    @objc func madeJuiceAlert(_ noti: Notification) {
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
    
    @objc func failedAlert(_ noti: Notification) {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: { ACTION in
            self.tappedModifyBarButton(UIBarButtonItem())
        })
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    @objc func updateStockCount(_ noti: Notification) {
        strawberryCountLabel.text = String(store.stock[Fruit.strawberry.index])
        bananaCountLabel.text = String(store.stock[Fruit.banana.index])
        pineappleCountLabel.text = String(store.stock[Fruit.pineapple.index])
        kiwiCountLabel.text = String(store.stock[Fruit.kiwi.index])
        mangoCountLabel.text = String(store.stock[Fruit.mango.index])
    }
}
