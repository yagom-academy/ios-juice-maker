//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let juiceMaker: JuiceMaker = JuiceMaker()
    let fruitStore: FruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        strawberryStockLabel.text = String(fruitStore.fruits[.strawberry] ?? 0)
        bananaStockLabel.text = String(fruitStore.fruits[.banana] ?? 0)
        pineappleStockLabel.text = String(fruitStore.fruits[.pineapple] ?? 0)
        kiwiStockLabel.text = String(fruitStore.fruits[.kiwi] ?? 0)
        mangoStockLabel.text = String(fruitStore.fruits[.mango] ?? 0)
    }
    
    @IBAction func strawberryBananaJuiceOrderButtonTapped(_ sender: Any) {
        juiceMaker.makeJuice(menu: .strawberryBananaJuice)
    }
    
    @IBAction func strawberryJuiceOrderButtonTapped(_ sender: Any) {
        juiceMaker.makeJuice(menu: .strawberryJuice)
    }

    
    @IBAction func bananaJuiceOrderButtonTapped(_ sender: Any) {
        juiceMaker.makeJuice(menu: .bananaJuice)
    }
    
    
    @IBAction func pineappleJuiceOrderButtonTapped(_ sender: Any) {
        juiceMaker.makeJuice(menu: .pineappleJuice)
    }
    
    
    @IBAction func mangokiwiJuiceOrderButtonTapped(_ sender: Any) {
        juiceMaker.makeJuice(menu: .mangoKiwiJuice)
    }
    
    
    @IBAction func kiwiJuiceOrderButtonTapped(_ sender: Any) {
        juiceMaker.makeJuice(menu: .kiwiJuice)
    }
    
    
    @IBAction func mangoJuiceOrderButtonTapped(_ sender: Any) {
        juiceMaker.makeJuice(menu: .mangoJuice)
    }
    
}
