//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.strawberry] ?? 0)
        bananaStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.banana] ?? 0)
        pineappleStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.pineapple] ?? 0)
        kiwiStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.kiwi] ?? 0)
        mangoStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.mango] ?? 0)
    }
    
    @IBAction func strawberryJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .strawberryJuice)
            strawberryStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.strawberry] ?? 0)
        } catch {
        }
    }
    
    @IBAction func bananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .bananaJuice)
            bananaStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.banana] ?? 0)
        } catch {
        }
    }
    
    @IBAction func pineappleJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .pineappleJuice)
            pineappleStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.pineapple] ?? 0)
        } catch {
        }
    }
    
    @IBAction func kiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .kiwiJuice)
            kiwiStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.kiwi] ?? 0)
        } catch {
        }
    }
    
    
    @IBAction func mangoJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .mangoJuice)
            mangoStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.mango] ?? 0)
        } catch {
        }
    }
    @IBAction func strawberryBananaButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .strawberryBananaJuice)
            strawberryStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.strawberry] ?? 0)
            bananaStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.banana] ?? 0)
        } catch {
        }
    }
    @IBAction func mangoKiwiButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .mangoKiwiJuice)
            mangoStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.mango] ?? 0)
            kiwiStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.kiwi] ?? 0)
        } catch {
        }
    }
}
