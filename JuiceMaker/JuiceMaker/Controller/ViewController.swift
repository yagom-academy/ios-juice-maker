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
    
    var juiceMaker = JuiceMaker()
   
    override func viewDidLoad() {
       super.viewDidLoad()
        
        updateStockLabel()
    }
    
    func updateStockLabel() {
        strawberryStockLabel.text = juiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = juiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = juiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction func ddalbaJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(.strawberryBananaJuice)
        updateStockLabel()
    }
    
    @IBAction func strawberryJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(.strawberryJuice)
        updateStockLabel()
    }
    
    @IBAction func bananaJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(.bananaJuice)
        updateStockLabel()
    }
    
    @IBAction func pineappleJuieButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(.pineappleJuice)
        updateStockLabel()
    }
    
    @IBAction func kiwiJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(.kiwiJuice)
        updateStockLabel()
    }
    
    @IBAction func mangoJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(.mangoJuice)
        updateStockLabel()
    }
    
    @IBAction func mankiJuiceButtonTapped(_ sender: UIButton) {
        juiceMaker.makeJuice(.mangoKiwiJuice)
        updateStockLabel()
    }
    
}

