//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.strawberryStockLabel.text = "\(fruitStore.fruitsStock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(fruitStore.fruitsStock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(fruitStore.fruitsStock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(fruitStore.fruitsStock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(fruitStore.fruitsStock[.mango] ?? 0)"
    }
    @IBAction func editStockButtonTapped(_ sender: UIBarButtonItem) {
        guard let editStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController") else { return }
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "뒤로가기", style: .plain, target: nil, action: nil)
        self.navigationController?.pushViewController(editStockViewController, animated: true)
    }
}

