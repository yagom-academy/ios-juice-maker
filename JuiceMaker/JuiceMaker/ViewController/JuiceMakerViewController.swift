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
            return lackStockAlert(JuiceMakerError.lackStock)
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
        strawberryLabel.initValue(fruit: .strawberry)
        bananaLabel.initValue(fruit: .banana)
        pineappleLabel.initValue(fruit: .pineapple)
        kiwiLabel.initValue(fruit: .kiwi)
        mangoLabel.initValue(fruit: .mango)
    }
}
