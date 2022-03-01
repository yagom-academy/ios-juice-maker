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
        updateFruitLabel()
    }
    
    private func updateFruitLabel() {
        let stock = juiceMaker.fruitStock
        
        let fruitLabelDictionary: [Fruit: UILabel] = [
            .strawberry: strawberryStockLabel,
            .banana: bananaStockLabel,
            .pineapple: pineappleStockLabel,
            .kiwi: kiwiStockLabel,
            .mango: mangoStockLabel
        ]
        
        for (fruit, amount) in stock {
            let label = fruitLabelDictionary[fruit]
            label?.text = "\(amount)"
        }
    }
    
    @IBAction func order(_ sender: UIButton) {
        do{
            let juice = try check(button: sender)
            try juiceMaker.make(fruitJuice: juice)
            updateFruitLabel()
            showOkAlert(title: "쥬스 나왔습니다! 맛있게 드세요!")
        } catch JuiceMakerError.invalidButton {
            showOkAlert(title: "버튼을 잘못 누르셨습니다.")
        } catch JuiceMakerError.outOfStock {
            showStockErrorAlert()
        } catch {
            showOkAlert(title: "알 수 없는 오류")
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

