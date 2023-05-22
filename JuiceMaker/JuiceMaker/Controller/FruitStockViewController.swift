//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by Zion, Mint = 형민트 on 2023/05/12.
//

import UIKit

final class FruitStockViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private var fruitStore: FruitStore
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.fruitStore = fruitStore
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpFruitLabelsText()
    }
    
    private func provideStockLabelText(fruit: Fruit) -> String {
        guard let stock = fruitStore.provideFruitStock(fruit) else {
            return "x"
        }
        
        return String(stock)
    }
    
    private func setUpFruitLabelsText() {
        strawberryLabel.text = provideStockLabelText(fruit: .strawberry)
        bananaLabel.text = provideStockLabelText(fruit: .banana)
        pineappleLabel.text = provideStockLabelText(fruit: .pineapple)
        kiwiLabel.text = provideStockLabelText(fruit: .kiwi)
        mangoLabel.text = provideStockLabelText(fruit: .mango)
    }
}
    
    // MARK: - Button Action
extension FruitStockViewController {
    @IBAction func tappedFruitStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
        fruitStore.changeFruitCount(fruit, amount: Int(sender.stepValue))
    }
}
