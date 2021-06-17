//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var fineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var fineappleJuiceButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    
    @IBAction func clickOrderButton(_ sender: UIButton) {
        switch sender {
        case strawberryJuiceButton:
            juiceMaker.makeJuice(menu: .strawberry)
        case bananaJuiceButton:
            juiceMaker.makeJuice(menu: .banana)
        case kiwiJuiceButton:
            juiceMaker.makeJuice(menu: .kiwi)
        case fineappleJuiceButton:
            juiceMaker.makeJuice(menu: .fineapple)
        case strawberryBananaJuiceButton:
            juiceMaker.makeJuice(menu: .strawberryBanana)
        case mangoJuiceButton:
            juiceMaker.makeJuice(menu: .mango)
        case mangoKiwiJuiceButton:
            juiceMaker.makeJuice(menu: .mangoKiwi)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshFruitStock()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveStockChangeNotification), name: DidRecieveStockChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveMenuMadeNotification), name: DidRecieveOrderMenuNotification, object: nil)
    }
    
    @objc func didReceiveStockChangeNotification(_ notificiation: Notification) {
        refreshFruitStock()
    }
    
    @objc func didReceiveMenuMadeNotification(_ notificiation: Notification) {
        if let menu: JuiceMenu = notificiation.userInfo?["menu"] as? JuiceMenu {
            let alert = successAlert(menu: menu)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = failAlert()
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func refreshFruitStock(){
        let fruits = FruitStore.shared.fruitStock
        for (fruit, _) in fruits {
            guard let stock = fruits[fruit] else { return }
            switch fruit {
            case.strawberry:
                strawberryStockLabel.text = "\(stock)"
            case.banana:
                bananaStockLabel.text = "\(stock)"
            case.fineapple:
                fineappleStockLabel.text = "\(stock)"
            case.kiwi:
                kiwiStockLabel.text = "\(stock)"
            case.mango:
                mangoStockLabel.text = "\(stock)"
            }
        }
    }
}

extension ViewController {
    func successAlert(menu: JuiceMenu) -> UIAlertController {
        let alert = UIAlertController(title: "\(menu.description()) 쥬스 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        return alert
    }
    func failAlert() -> UIAlertController {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("예", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("아니오", comment: "Default action"), style: .cancel, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        return alert
    }
}
