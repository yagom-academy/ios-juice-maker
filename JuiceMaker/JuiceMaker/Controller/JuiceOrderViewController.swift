//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary

import UIKit

class JuiceOrderViewController: UIViewController {
    let fruitStore = FruitStore.shared
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hitJuiceOrderButton(_ sender: UIButton) {
        guard let choosedJuice = findJuice(by: sender.tag) else { return }
        placeAnOrder(for: choosedJuice)
    }
    
    func placeAnOrder(for juice: Juice) {
        guard let juice = juiceMaker.takeOrder(juice) else { return }
        
    }
    
    func findJuice(by tag: Int) -> Juice? {
        switch tag {
        case 1:
            return .strawberryJuice
        case 2:
            return .bananaJuice
        case 3:
            return .pineappleJuice
        case 4:
            return .kiwiJuice
        case 5:
            return .mangoJuice
        case 6:
            return .strawberryBananaJuice
        case 7:
            return .mangoKiwiJuice
        default:
            return nil
        }
    }
}

