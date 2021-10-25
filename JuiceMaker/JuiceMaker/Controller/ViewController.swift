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
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker(store: FruitStore())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAllLables()
    }
    
    @IBAction func juiceOrderButtonDidTap(_ sender: UIButton) {
        do {
            try makeJuice(sender: sender)
            updateAllLables()
        } catch {
            
        }
    }
    
    func updateAllLables() {
        do {
            strawberryStockLabel.text = String(try juiceMaker.currentFruitStock(of: .strawberry))
            bananaStockLabel.text = String(try juiceMaker.currentFruitStock(of: .banana))
            pineappleStockLabel.text = String(try juiceMaker.currentFruitStock(of: .pineapple))
            kiwiStockLabel.text = String(try juiceMaker.currentFruitStock(of: .kiwi))
            mangoStockLabel.text = String(try juiceMaker.currentFruitStock(of: .mango))
        } catch {
            
        }
    }
    
    func makeJuice(sender: UIButton) throws {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            try juiceMaker.makeJuice(menu: .strawberryBanana)
        case mangoKiwiJuiceOrderButton:
            try juiceMaker.makeJuice(menu: .mangoKiwi)
        case strawberryJuiceOrderButton:
            try juiceMaker.makeJuice(menu: .strawberry)
        case bananaJuiceOrderButton:
            try juiceMaker.makeJuice(menu: .banana)
        case pineappleJuiceOrderButton:
            try juiceMaker.makeJuice(menu: .pineapple)
        case kiwiJuiceOrderButton:
            try juiceMaker.makeJuice(menu: .kiwi)
        case mangoJuiceOrderButton:
            try juiceMaker.makeJuice(menu: .mango)
        default:
            throw JuiceOrderError.invalidJuiceOrder
        }
    }
}

