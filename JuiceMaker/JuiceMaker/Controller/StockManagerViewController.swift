//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Harry, kokkilE. 
//

import UIKit

class StockManagerViewController: UIViewController {

    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    let fruitStore = FruitStore.shared
    
    var fruitLabelsDictionary: [Fruit: UILabel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defineDictionary()
        configureFruitCountLabels()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)        
    }
    
    func defineDictionary() {
        fruitLabelsDictionary = [
            .strawberry: strawberryCountLabel,
            .banana: bananaCountLabel,
            .kiwi: kiwiCountLabel,
            .pineapple: pineappleCountLabel,
            .mango: mangoCountLabel
        ]
    }

    func configureFruitCountLabels() {
        for fruit in Fruit.allCases {
            fruitLabelsDictionary[fruit]?.text = fruitStore.getStockCountToString(of: fruit)
        }
    }
}
