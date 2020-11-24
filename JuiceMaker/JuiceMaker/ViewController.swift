//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fruitImageView1: UIImageView!
    @IBOutlet weak var fruitImageView2: UIImageView!
    @IBOutlet weak var fruitImageView3: UIImageView!
    @IBOutlet weak var fruitImageView4: UIImageView!
    @IBOutlet weak var fruitImageView5: UIImageView!
    
    @IBOutlet weak var fruitStockLabel1: UILabel!
    @IBOutlet weak var fruitStockLabel2: UILabel!
    @IBOutlet weak var fruitStockLabel3: UILabel!
    @IBOutlet weak var fruitStockLabel4: UILabel!
    @IBOutlet weak var fruitStockLabel5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fruitStock = FruitStock(initialFruitNumber: 10)
        fruitStockLabel1.text = "\(fruitStock.strawberry)"
        fruitStockLabel2.text = "\(fruitStock.banana)"
        fruitStockLabel3.text = "\(fruitStock.pineapple)"
        fruitStockLabel4.text = "\(fruitStock.kiwi)"
        fruitStockLabel5.text = "\(fruitStock.mango)"
    }

    @IBAction func juiceOrderButton1(_ sender: UIButton) {
    }
    @IBAction func juiceOrderButton2(_ sender: UIButton) {
    }
    @IBAction func juiceOrderButton3(_ sender: UIButton) {
    }
    @IBAction func juiceOrderButton4(_ sender: UIButton) {
    }
    @IBAction func juiceOrderButton5(_ sender: UIButton) {
    }
    @IBAction func juiceOrderButton6(_ sender: UIButton) {
    }
    @IBAction func juiceOrderButton7(_ sender: UIButton) {
    }
}

