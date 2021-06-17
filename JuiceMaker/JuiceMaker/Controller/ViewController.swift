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
        var juice: JuiceMenu?
        switch sender {
        case strawberryJuiceButton:
            juice = .strawberry
        case bananaJuiceButton:
            juice = .banana
        case kiwiJuiceButton:
            juice = .kiwi
        case fineappleJuiceButton:
            juice = .fineapple
        case strawberryBananaJuiceButton:
            juice = .strawberryBanana
        case mangoJuiceButton:
            juice = .mango
        case mangoKiwiJuiceButton:
            juice = .mangoKiwi
        default:
            break
        }
        do {
            guard let juiceName = juice else { return }
            try juiceMaker.makeJuice(menu: juiceName)
        } catch FruitStoreError.outOfStock {
            NotificationCenter.default.post(name: DidRecieveOrderMenuNotification, object: nil, userInfo: nil)
            print("Don't have enough fruit to make the juice")
        } catch {
            print("Invalid Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveStockChangeNotification), name: DidRecieveStockChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveMenuMadeNotification), name: DidRecieveOrderMenuNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFruitStock()
    }
    @objc func didReceiveStockChangeNotification(_ notificiation: Notification) {
        refreshFruitStock()
    }
    
    @objc func didReceiveMenuMadeNotification(_ notificiation: Notification) {
        if let menu: JuiceMenu = notificiation.userInfo?["menu"] as? JuiceMenu {
            let alert = makeJuiceSuccessAlert(menu: menu)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = makeJuiceFailAlert()
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
    func makeJuiceSuccessAlert(menu: JuiceMenu) -> UIAlertController {
        let alert = UIAlertController(title: "\(menu.description()) 쥬스 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
        return alert
    }
    
    func makeJuiceFailAlert() -> UIAlertController {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("예", comment: "Default action"), style: .default, handler: { _ in
            guard let nextViewController = self.storyboard?.instantiateViewController(identifier: "StockManageViewController") else { return }
            self.present(nextViewController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("아니오", comment: "Default action"), style: .cancel, handler: nil))
        return alert
    }
}
