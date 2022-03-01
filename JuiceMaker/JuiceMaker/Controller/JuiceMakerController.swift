//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func order(_ sender: UIButton) {
        do{
            let juice = try check(button: sender)
            try juiceMaker.make(fruitJuice: juice)
        } catch JuiceMakerError.invalidButton {
            
        } catch JuiceMakerError.outOfStock {
            
        } catch {
            
        }
    }
    
    private func check(button: UIButton) throws -> Juice {
        switch button {
        case strawberryBananaButton:
            return .strawberryBananaJuice
        case strawberryButton:
            return .strawberryJuice
        case bananaButton:
            return .bananaJuice
        case pineappleButton:
            return .pineappleJuice
        case mangoKiwiButton:
            return .mangoKiwiJuice
        case kiwiButton:
            return .kiwiJuice
        case mangoButton:
            return .mangoJuice
        default:
            throw JuiceMakerError.invalidButton
        }
    }
}

