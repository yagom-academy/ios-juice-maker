//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberOfStrawberry: UILabel!
    @IBOutlet var numberOfBanana: UILabel!
    @IBOutlet var numberOfPineApple: UILabel!
    @IBOutlet var numberOfKiwi: UILabel!
    @IBOutlet var numberOfMango: UILabel!
    
    @IBOutlet var orderStrawberryButton: UIButton!
    @IBOutlet var orderBananaButton: UIButton!
    @IBOutlet var orderPineAppleButton: UIButton!
    @IBOutlet var orderkiwiButton: UIButton!
    @IBOutlet var orderMangoButton: UIButton!
    @IBOutlet var orderStrawberryBananaButton: UIButton!
    @IBOutlet var orderMangoKiwiButton: UIButton!
    
    var juiceMaker = JuiceMaker(fruitStore: FruitStore())
    
    func takeInitialNumber(of fruit: Fruit) -> Int {
        var initialNumber: Int
        do {
           initialNumber = try juiceMaker.fruitStore.giveBackNumberIfExist(of: fruit)
        } catch {
            initialNumber = 0
        }
        return initialNumber
    }
    
    func setUp(number: Int, on label: UILabel) {
        label.text = String(number)
    }
    
    func showInitialNumberOnLabel() {
        setUp(number: takeInitialNumber(of: .strawberry), on: numberOfStrawberry)
        setUp(number: takeInitialNumber(of: .banana), on: numberOfBanana)
        setUp(number: takeInitialNumber(of: .mango), on: numberOfMango)
        setUp(number: takeInitialNumber(of: .pineapple), on: numberOfPineApple)
        setUp(number: takeInitialNumber(of: .kiwi), on: numberOfKiwi)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialNumberOnLabel()
        
        orderStrawberryButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderPineAppleButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderkiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderStrawberryBananaButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
        orderMangoKiwiButton.addTarget(self, action: #selector(orderJuice(_:)), for: .touchUpInside)
    }
    
    @objc func orderJuice(_ sender: UIButton) {
        let result: JuiceMaker.JuiceMakingResult
        switch sender {
        case orderStrawberryButton:
            result = juiceMaker.produce(kindOf: .strawberry)
        case orderBananaButton:
            result = juiceMaker.produce(kindOf: .banana)
        case orderPineAppleButton:
            result = juiceMaker.produce(kindOf: .pineapple)
        case orderkiwiButton:
            result = juiceMaker.produce(kindOf: .kiwi)
        case orderMangoButton:
            result = juiceMaker.produce(kindOf: .mango)
        case orderStrawberryBananaButton:
            result = juiceMaker.produce(kindOf: .strawberryBanana)
        case orderMangoKiwiButton:
            result = juiceMaker.produce(kindOf: .mangoKiwi)
        default:
            let message = "알 수 없는 버튼을 누르셨습니다."
            result = .failure(description: message)
        }
        
    }
 
}

