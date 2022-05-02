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
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func orderFruitJuice(_ sender: UIButton) {
        switch sender {
        case strawberryBananaJuiceButton:
            print("StrawberryBananaJuice")
        case mangoKiwiJuiceButton:
            print("MangoKiwiJuice")
        case strawberryJuiceButton:
            print("StrawberryJuice")
        case bananaJuiceButton:
            print("BananaJuice")
        case pineappleJuiceButton:
            print("PineappleJuice")
        case kiwiJuiceButton:
            print("KiwiJuice")
        case mangoJuiceButton:
            print("MangoJuice")
        default:
            break
        }
    }
}

