//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    
    @IBAction func orderButtonHandler(_ sender: UIButton) {
        switch sender {
        case strawberryJuiceButton:
            order(.strawberryJuice)
        case bananaJuiceButton:
            order(.bananaJuice)
        case pineappleJuiceButton:
            order(.pineappleJuice)
        case kiwiJuiceButton:
            order(.kiwiJuice)
        case mangoJuiceButton:
            order(.mangoJuice)
        case strawberryBananaJuiceButton:
            order(.strawberryBananaJuice)
        case mangoKiwiJuiceButton:
            order(.mangoKiwiJuice)
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAmountLabels()
    }
    
    func order(_ juice: JuiceMaker.Juice) {
        juiceMaker.make(juice)
        // 여기 do-try-catch 써서, 재고 부족 에러 올라오면 알러트 띄우도록.
        // 성공하면, 레이블 업데이트 시키고, 또 알러트 띄우고.
        updateAmountLabels()
    }
    
    func updateAmountLabels() {
        strawberryAmountLabel.text = String(fruitStore.inventory[.strawberry] ?? 0)
        bananaAmountLabel.text = String(fruitStore.inventory[.banana] ?? 0)
        mangoAmountLabel.text = String(fruitStore.inventory[.mango] ?? 0)
        kiwiAmountLabel.text = String(fruitStore.inventory[.kiwi] ?? 0)
        pineappleAmountLabel.text = String(fruitStore.inventory[.pineapple] ?? 0)
    }
}

