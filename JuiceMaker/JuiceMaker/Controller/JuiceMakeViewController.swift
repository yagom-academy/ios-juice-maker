//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakeViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var fineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var fineappleJuiceButton: UIButton!
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    
    @IBAction func clickStrawberryJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(menu: .strawberry)
            self.present(makeJuiceSuccessAlert(menu: .strawberry), animated: true, completion: nil)
            refreshFruitStock()
        } catch FruitStoreError.outOfStock {
            self.present(makeJuiceFailAlert(), animated: true, completion: nil)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func clickBananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(menu: .banana)
            self.present(makeJuiceSuccessAlert(menu: .banana), animated: true, completion: nil)
            refreshFruitStock()
        } catch FruitStoreError.outOfStock {
            self.present(makeJuiceFailAlert(), animated: true, completion: nil)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func clickFineappleJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(menu: .fineapple)
            self.present(makeJuiceSuccessAlert(menu: .fineapple), animated: true, completion: nil)
            refreshFruitStock()
        } catch FruitStoreError.outOfStock {
            self.present(makeJuiceFailAlert(), animated: true, completion: nil)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func clickStrawberryBananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(menu: .strawberryBanana)
            self.present(makeJuiceSuccessAlert(menu: .strawberryBanana), animated: true, completion: nil)
            refreshFruitStock()
        } catch FruitStoreError.outOfStock {
            self.present(makeJuiceFailAlert(), animated: true, completion: nil)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func clickKiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(menu: .kiwi)
            self.present(makeJuiceSuccessAlert(menu: .kiwi), animated: true, completion: nil)
            refreshFruitStock()
        } catch FruitStoreError.outOfStock {
            self.present(makeJuiceFailAlert(), animated: true, completion: nil)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func clickMangoJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(menu: .mango)
            self.present(makeJuiceSuccessAlert(menu: .mango), animated: true, completion: nil)
            refreshFruitStock()
        } catch FruitStoreError.outOfStock {
            self.present(makeJuiceFailAlert(), animated: true, completion: nil)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func clickMangoKiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(menu: .mangoKiwi)
            self.present(makeJuiceSuccessAlert(menu: .mangoKiwi), animated: true, completion: nil)
            refreshFruitStock()
        } catch FruitStoreError.outOfStock {
            self.present(makeJuiceFailAlert(), animated: true, completion: nil)
        } catch {
            print("Unexpected error: \(error).")
        }
    }
    
    @IBAction func clickStockChangeButton(_ sender: UIBarButtonItem) {
        guard let nextViewController = self.storyboard?.instantiateViewController(identifier: "StockManageViewController") else { return }
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshFruitStock()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveStockChangeNotification), name: .recieveStockChangeNotification, object: nil)
    }
    
    @objc func didReceiveStockChangeNotification(_ notification: Notification) {
        guard let stockChangeInformation: (fruit: FruitStore.HandlingFruit, amount: Int) = notification.userInfo?["fruit"] as? (FruitStore.HandlingFruit, Int) else { return }
        switch stockChangeInformation.fruit {
        case .strawberry:
            FruitStore.shared.changeFruitStock(fruit: .strawberry, amount: stockChangeInformation.amount)
            strawberryStockLabel.text = "\(stockChangeInformation.amount)"
        case .banana:
            FruitStore.shared.changeFruitStock(fruit: .banana, amount: stockChangeInformation.amount)
            bananaStockLabel.text = "\(stockChangeInformation.amount)"
        case .fineapple:
            FruitStore.shared.changeFruitStock(fruit: .fineapple, amount: stockChangeInformation.amount)
            fineappleStockLabel.text = "\(stockChangeInformation.amount)"
        case .kiwi:
            FruitStore.shared.changeFruitStock(fruit: .kiwi, amount: stockChangeInformation.amount)
            kiwiStockLabel.text = "\(stockChangeInformation.amount)"
        case .mango:
            FruitStore.shared.changeFruitStock(fruit: .mango, amount: stockChangeInformation.amount)
            mangoStockLabel.text = "\(stockChangeInformation.amount)"
        }
    }
    
    private func refreshFruitStock(){
        let fruits = FruitStore.shared.fruitStock
        for (fruit, amount) in fruits {
            switch fruit {
            case.strawberry:
                strawberryStockLabel.text = "\(amount)"
            case.banana:
                bananaStockLabel.text = "\(amount)"
            case.fineapple:
                fineappleStockLabel.text = "\(amount)"
            case.kiwi:
                kiwiStockLabel.text = "\(amount)"
            case.mango:
                mangoStockLabel.text = "\(amount)"
            }
        }
    }
}

extension JuiceMakeViewController {
    private func makeJuiceSuccessAlert(menu: JuiceMaker.JuiceMenu) -> UIAlertController {
        let alert = UIAlertController(title: "\(menu.description()) 쥬스 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
        return alert
    }
    
    private func makeJuiceFailAlert() -> UIAlertController {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("예", comment: "Default action"), style: .default, handler: { _ in
            guard let nextViewController = self.storyboard?.instantiateViewController(identifier: "StockManageViewController") else { return }
            self.present(nextViewController, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("아니오", comment: "Default action"), style: .cancel, handler: nil))
        return alert
    }
}
