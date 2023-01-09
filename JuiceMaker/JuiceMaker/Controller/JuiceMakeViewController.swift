//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakeViewController: UIViewController {

    let fruitStore = FruitStore.shared
    
    var currentFruitBasket: [Fruit: Int] {
        return FruitStore.shared.shareFruitBasket()
    }
    
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpLabel()
    }
    
    func setUpLabel() {
        strawberryLabel.text = currentFruitBasket[.strawberry]?.description
        bananaLabel.text = currentFruitBasket[.banana]?.description
        pineappleLabel.text = currentFruitBasket[.pineapple]?.description
        kiwiLabel.text = currentFruitBasket[.kiwi]?.description
        mangoLabel.text = currentFruitBasket[.mango]?.description
        [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel].forEach {
            $0.sizeToFit()
        }
    }
    
    func buttonTarget(_ sender: UIButton) -> FruitJuice? {
        guard let titleLabel = sender.titleLabel?.text else {
            return nil
        }
        
        switch titleLabel {
        case "딸기쥬스 주문":
            return FruitJuice.strawberryJuice
        case "바나나쥬스 주문":
            return FruitJuice.bananaJuice
        case "파인애플쥬스 주문":
            return FruitJuice.pineappleJuice
        case "키위쥬스 주문":
            return FruitJuice.kiwiJuice
        case "망고쥬스 주문":
            return FruitJuice.mangoJuice
        case "딸바쥬스 주문":
            return FruitJuice.strawberryBananaJuice
        case "망키쥬스 주문":
            return FruitJuice.mangoKiwiJuice
        default:
            return nil
        }
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let targetJuice = buttonTarget(sender) else {
            return
        }
    }
    
}

