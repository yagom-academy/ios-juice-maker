//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private let fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
    private lazy var yagombucks = JuiceMaker(fruitStore: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yagombucks.delegate = self
        loadFruitStock()
    }
    
    private func loadFruitStock() {
        strawberryLabel.text = String(fruitStore.provideFruitStock(.strawberry))
        bananaLabel.text = String(fruitStore.provideFruitStock(.banana))
        kiwiLabel.text = String(fruitStore.provideFruitStock(.kiwi))
        mangoLabel.text = String(fruitStore.provideFruitStock(.mango))
        pineappleLabel.text = String(fruitStore.provideFruitStock(.pineapple))
    }
}

// MARK: - Button Action
extension JuiceOrderViewController {
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let juice = JuiceMaker.Menu(rawValue: sender.tag) else { return }
        
        yagombucks.makeJuice(menu: juice)
    }
    
    @IBAction func changeStockButtonTapped(_ sender: Any) {
        let pushJuiceOrderViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController")
        
        self.navigationController?.pushViewController(pushJuiceOrderViewController!, animated: true)
    }
}

// MARK: - JuiceMake Delegate
extension JuiceOrderViewController: JuiceMakeDelegate {
    func successJuiceMake() {
        // Alert
    }
    
    func failJuiceMake() {
        // Alert
    }
    
    func changeFruitStock(fruit: Fruit, amount: String) {
        switch fruit {
            case .strawberry:
                strawberryLabel.text = amount
            case .banana:
                bananaLabel.text = amount
            case .kiwi:
                kiwiLabel.text = amount
            case .mango:
                mangoLabel.text = amount
            case .pineapple:
                pineappleLabel.text = amount
        }
    }
}
