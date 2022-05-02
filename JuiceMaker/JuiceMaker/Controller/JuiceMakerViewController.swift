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
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBAction func orderFruitJuice(_ sender: UIButton) {
        switch sender {
        case strawberryBananaJuiceButton:
            alertResult(juiceMaker.takeOrder(.strawberryAndBananaJuice))
        case mangoKiwiJuiceButton:
            alertResult(juiceMaker.takeOrder(.mangoAndKiwiJuice))
        case strawberryJuiceButton:
            alertResult(juiceMaker.takeOrder(.strawberryJuice))
        case bananaJuiceButton:
            alertResult(juiceMaker.takeOrder(.bananaJuice))
        case pineappleJuiceButton:
            alertResult(juiceMaker.takeOrder(.pineappleJuice))
        case kiwiJuiceButton:
            alertResult(juiceMaker.takeOrder(.kiwiJuice))
        case mangoJuiceButton:
            alertResult(juiceMaker.takeOrder(.mangoJuice))
        default:
            break
        }
    }
    
    func alertResult(_ result: (fruitJuice: FruitJuice, result: Bool)) {
        print(result.fruitJuice)
        print(result.result)
    }
}
