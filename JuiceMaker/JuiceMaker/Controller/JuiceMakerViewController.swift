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
    
    @IBAction func juiceOrderButtonTapped(_ sender: UIButton) {
        var menu: JuiceMenu?
        
        switch sender.tag {
        case 0:
            menu = .strawberryBananaJuice
        case 1:
            menu = .strawberryJuice
        case 2:
            menu = .bananaJuice
        case 3:
            menu = .pineappleJuice
        case 4:
            menu = .mangoKiwiJuice
        case 5:
            menu = .kiwiJuice
        case 6:
            menu = .mangoJuice
        default:
            break
        }
        
        makeJuice(of: menu)
    }
    
    func makeJuice(of menu: JuiceMenu?) {
        guard let menu = menu else {
            return
        }
        
        do {
            try juiceMaker.makeJuice(menu: menu)
        } catch Errors.outOfStock {
            print(Errors.outOfStock)
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
