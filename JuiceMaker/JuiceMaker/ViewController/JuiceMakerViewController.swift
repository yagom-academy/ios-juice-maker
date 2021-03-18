//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 
import UIKit

final class JuiceMakerViewController: UIViewController {
    private var juiceMaker = JuiceMaker.shared
    
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
                                               selector: #selector(updateLabel(_ :)),
                                               name: Notification.Name(rawValue: "changeFruitAmount"),
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // TODO: - 재고 수정 반영
    }
        
    // MARK: - Action
    
    @IBAction func touchUpJuiceOrderButton(_ sender: Any) {
        let orderButton = sender as? OrderButton
        guard let kindJuice = orderButton?.kindJuice else {
            return
        }
        guard juiceMaker.make(order: kindJuice) else {
            return lakeStockAlert(JuiceMakerError.lackStock)
        }
        orderSuccessAlert(kindJuice)
    }
    
    @IBAction func touchUpModifyStock(_ sender: Any) {
        guard let StockManagerViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerViewController") as? StockManagerViewController else {
            return
        }
        StockManagerViewController.modalPresentationStyle = .fullScreen
        self.present(StockManagerViewController,animated: true)
    }
    
    // MARK: - Update Data
    
     @objc private func updateLabel(_ notification: Notification) {
        switch notification.object! {
        case Fruits.strawberry :
            strawberryLabel.text = String(juiceMaker.currentFruit(fruit: .strawberry))
        case Fruits.banana :
            bananaLabel.text = String(juiceMaker.currentFruit(fruit: .banana))
        case Fruits.pineapple :
            pineappleLabel.text = String(juiceMaker.currentFruit(fruit: .pineapple))
        case Fruits.kiwi :
            kiwiLabel.text = String(juiceMaker.currentFruit(fruit: .kiwi))
        case Fruits.mango :
            mangoLabel.text = String(juiceMaker.currentFruit(fruit: .mango))
        default:
            return
        }
    }
    
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
        strawberryLabel.initValue(fruit: .strawberry, amount: juiceMaker.currentFruit(fruit: .strawberry))
        bananaLabel.initValue(fruit: .banana, amount: juiceMaker.currentFruit(fruit: .banana))
        pineappleLabel.initValue(fruit: .pineapple, amount: juiceMaker.currentFruit(fruit: .pineapple))
        kiwiLabel.initValue(fruit: .kiwi, amount: juiceMaker.currentFruit(fruit: .kiwi))
        mangoLabel.initValue(fruit: .mango, amount: juiceMaker.currentFruit(fruit: .mango))
    }
}
