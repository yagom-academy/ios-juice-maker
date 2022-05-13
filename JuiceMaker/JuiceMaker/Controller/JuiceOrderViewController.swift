//
//  JuiceMaker - JuiceOrderViewController.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

let center = NotificationCenter.default

class JuiceOrderViewController: UIViewController {
    @IBOutlet private var fruitsLabel: [UILabel]!
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButton()
        updateFruitStockLabelText()
        registerStockChanges()
    }

    private func updateFruitStockLabelText() {
        for index in 0..<fruitsLabel.count {
            fruitsLabel[index].text = String(Int(juiceMaker.fruitStore.fruitWarehouse[Fruit(rawValue: index) ?? Fruit.unknownFruit] ?? 0))
        }
    }
    
    @IBAction private func makeJuice(_ sender: UIButton) {
        var juice: Juice {
            switch sender.currentTitle {
            case "딸기쥬스 주문":
                return .strawberry
            case "바나나쥬스 주문":
                return .banana
            case "파인애플쥬스 주문":
                return .pineapple
            case "키위쥬스 주문":
                return .kiwi
            case "딸바쥬스 주문":
                return .strawberryBanana
            case "망고쥬스 주문":
                return .mango
            case "망키쥬스 주문":
                return .mangoKiwi
            default:
                return .unknownFruit
            }
        }
        
        tryMaking(juice)
        updateFruitStockLabelText()
    }
    
    private func tryMaking(_ juice: Juice) {
        do {
            try juiceMaker.make(juice)
            showSuccessAlert(juice)
        } catch FruitStoreError.outOfStock {
            showFailAlert()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func showSuccessAlert(_ juice: Juice) {
        let successAlert = UIAlertController(title: "\(juice.name) 쥬스 나왔습니다!\n 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

        successAlert.addAction(ok)
        present(successAlert, animated: true)
    }
    
    private func showFailAlert() {
        let failAlert = UIAlertController(title: "재료가 모자라요.\n 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let no = UIAlertAction(title: "아니오", style: .cancel)
        let yes = UIAlertAction(title: "예", style: .default) { action in
            self.goToFruitStockViewController()
        }
        
        failAlert.addAction(no)
        failAlert.addAction(yes)
        present(failAlert, animated: true)
    }
    
    @IBAction private func navigationRightButtonTapped(_ sender: UIBarButtonItem) {
        goToFruitStockViewController()
    }
        
    private func goToFruitStockViewController() {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") as? FruitStockViewController else { return }
        
        let modalViewController = UINavigationController(rootViewController: controller)
        
        sendFruitStoreData(to: controller)
        present(modalViewController, animated: true)
    }
    
    private func sendFruitStoreData(to controller: FruitStockViewController) {
        controller.fruitStore = juiceMaker.fruitStore
    }
    
    private func registerStockChanges() {
        center.addObserver(self, selector: #selector(updateFruitStock), name: .updateFruitStock, object: nil)
    }
    
    @objc private func updateFruitStock(_ notification: Notification) {
        tryUpdateFruitStock(notification)
        updateFruitStockLabelText()
    }
    
    private func tryUpdateFruitStock(_ notification: Notification) {
        let updatedFruitStock = notification.userInfo?["updatedFruitStock"] as? [UILabel] ?? []
        
        for index in 0..<updatedFruitStock.count {
            try? juiceMaker.fruitStore.changeStock(fruit: Fruit(rawValue: index) ?? Fruit.unknownFruit, amount: Int(updatedFruitStock[index].text ?? "") ?? 0)
        }
    }
    
    private func setUpButton() {
        strawberryBananaJuiceButton.setUp(lineBreakMode: .byWordWrapping, textAlignment: .center, font: .systemFont(ofSize: 20))
        strawberryJuiceButton.setUp(lineBreakMode: .byWordWrapping, textAlignment: .center, font: .systemFont(ofSize: 20))
        bananaJuiceButton.setUp(lineBreakMode: .byWordWrapping, textAlignment: .center, font: .systemFont(ofSize: 20))
        pineappleJuiceButton.setUp(lineBreakMode: .byWordWrapping, textAlignment: .center, font: .systemFont(ofSize: 20))
        kiwiJuiceButton.setUp(lineBreakMode: .byWordWrapping, textAlignment: .center, font: .systemFont(ofSize: 20))
        mangoJuiceButton.setUp(lineBreakMode: .byWordWrapping, textAlignment: .center, font: .systemFont(ofSize: 20))
        mangoKiwiJuiceButton.setUp(lineBreakMode: .byWordWrapping, textAlignment: .center, font: .systemFont(ofSize: 20))
    }
}

extension Notification.Name {
    static let updateFruitStock = Notification.Name("updateFruitStock")
}

extension UIButton {
    func setUp(lineBreakMode: NSLineBreakMode, textAlignment: NSTextAlignment, font: UIFont) {
        self.titleLabel?.lineBreakMode = lineBreakMode
        self.titleLabel?.textAlignment = textAlignment
        self.titleLabel?.font = font
    }
}
