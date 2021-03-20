//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 
import UIKit

final class JuiceMakerViewController: UIViewController { 
    @IBOutlet private weak var strawberryLabel: FruitStockLabel!
    @IBOutlet private weak var bananaLabel: FruitStockLabel!
    @IBOutlet private weak var pineappleLabel: FruitStockLabel!
    @IBOutlet private weak var mangoLabel: FruitStockLabel!
    @IBOutlet private weak var kiwiLabel: FruitStockLabel!
    
    @IBOutlet private weak var strawberryButton: OrderButton!
    @IBOutlet private weak var bananaButton: OrderButton!
    @IBOutlet private weak var pineappleButton: OrderButton!
    @IBOutlet private weak var kiwiButton: OrderButton!
    @IBOutlet private weak var mangoButton: OrderButton!
    @IBOutlet private weak var mangoKiwiButton: OrderButton!
    @IBOutlet private weak var strawberyBananaButton: OrderButton!
    
    // MARK: - ViewLife Cycle
    
    override func viewDidLoad() {
        initFuritLabel()
        initJuiceButton()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changedStock(_ :)),
                                               name: Notification.Name(rawValue: "changeFruitAmount"),
                                               object: nil)
    }
        
    // MARK: - Action
    
    @IBAction private func touchUpJuiceOrderButton(_ sender: Any) {
        let orderButton = sender as? OrderButton
        guard let kindJuice = orderButton?.kindJuice else {
            return
        }
        guard JuiceMaker.shared.make(order: kindJuice) else {
            return lackStockAlert(JuiceMakerError.lackStock)
        }
        orderSuccessAlert(kindJuice)
    }
    
    @IBAction private func touchUpModifyStock(_ sender: Any) {
        guard let StockManagerViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerViewController") as? StockManagerViewController else {
            return
        }
        StockManagerViewController.modalPresentationStyle = .fullScreen
        self.present(StockManagerViewController,animated: true)
    }
    
    @objc private func changedStock(_ notification: Notification) {
        guard let fruit = notification.object as? Fruits else {
            return
        }
        switch fruit {
        case .strawberry:
            strawberryLabel.updateLabel(kindFruit: .strawberry, fruitAmount: JuiceMaker.shared.currentFruit(kindFruit: .strawberry))
        case .banana:
            bananaLabel.updateLabel(kindFruit: .banana, fruitAmount: JuiceMaker.shared.currentFruit(kindFruit: .banana))
        case .pineapple:
            pineappleLabel.updateLabel(kindFruit: .pineapple, fruitAmount: JuiceMaker.shared.currentFruit(kindFruit: .pineapple))
        case .kiwi:
            kiwiLabel.updateLabel(kindFruit: .kiwi, fruitAmount: JuiceMaker.shared.currentFruit(kindFruit: .kiwi))
        case .mango:
            mangoLabel.updateLabel(kindFruit: .mango, fruitAmount: JuiceMaker.shared.currentFruit(kindFruit: .mango))
        }
    }
    
    // MARK: - Update Data
    
    private func initJuiceButton() {
        strawberryButton.initValue(kindJuice: .strawberryJuice)
        bananaButton.initValue(kindJuice: .bananaJuice)
        pineappleButton.initValue(kindJuice: .pineappleJuice)
        kiwiButton.initValue(kindJuice: .kiwiJuice)
        mangoButton.initValue(kindJuice: .mangoJuice)
        mangoKiwiButton.initValue(kindJuice: .mangoKiwiJuice)
        strawberyBananaButton.initValue(kindJuice: .strawberryBananaJuice)
    }
    
    private func initFuritLabel() {
        strawberryLabel.initValue(fruit: .strawberry, amount: JuiceMaker.shared.currentFruit(kindFruit: .strawberry))
        bananaLabel.initValue(fruit: .banana, amount: JuiceMaker.shared.currentFruit(kindFruit: .banana))
        pineappleLabel.initValue(fruit: .pineapple, amount: JuiceMaker.shared.currentFruit(kindFruit: .pineapple))
        kiwiLabel.initValue(fruit: .kiwi, amount: JuiceMaker.shared.currentFruit(kindFruit: .kiwi))
        mangoLabel.initValue(fruit: .mango, amount: JuiceMaker.shared.currentFruit(kindFruit: .mango))
    }
    
    // MARK: - Alert
    
    private func lackStockAlert(_ error: Error) {
        var errorMessgae: String?
        if let juiceError = error as? JuiceMakerError {
            errorMessgae = juiceError.localizedDescription
        } else {
            errorMessgae = JuiceMakerError.unknown.localizedDescription
        }
        let failAlert = UIAlertController(title: nil , message: errorMessgae, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .cancel)
        let stockSettingAction = UIAlertAction(title: "예", style: .default) { action in
            guard let stockManagerViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerViewController") as? StockManagerViewController else {
                return
            }
            stockManagerViewController.modalPresentationStyle = .fullScreen
            self.present(stockManagerViewController,animated: true)
        }
        failAlert.addAction(stockSettingAction)
        failAlert.addAction(cancel)
        present(failAlert, animated: true, completion: nil)
    }
    
    private func orderSuccessAlert(_ kindJuice: Juices) {
        let alert = UIAlertController(title: "주문 확인", message: "\(kindJuice) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
