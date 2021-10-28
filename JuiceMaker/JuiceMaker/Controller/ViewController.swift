//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let fruitStore = FruitStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try updateFruitStockLabel()
        } catch {
            print("없는 과일입니다.")
        }
    }
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    func updateFruitStockLabel() throws {
        guard let strawberryStock = fruitStore.stock[Fruit.strawberry],
                let bananaStock = fruitStore.stock[Fruit.banana],
                let pineappleStock = fruitStore.stock[Fruit.pineapple],
                let kiwiStock = fruitStore.stock[Fruit.kiwi],
                let mangoStock = fruitStore.stock[Fruit.mango] else {
                    throw StockError.noExistFruit
                }
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
}

