//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {   
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJucieOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        let order = takeOrder(sender: sender)
        do {
            try juiceMaker.produce(juice: order)
            configureLabels()
        } catch (let error) {
            JuiceMakerError.printOutput(of: error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureLabels()
    }
    
    private func configureLabels() {
        let labels: [UILabel] = [strawberryAmountLabel, bananaAmountLabel, pineappleAmountLabel, kiwiAmountLabel, mangoAmountLabel]
        
        for label in labels {
            matchLabels(label: label)
        }
    }
    
    private func matchLabels(label: UILabel) {
        switch label {
        case strawberryAmountLabel:
            configureLabel(label: label, fruit: .strawberry)
        case bananaAmountLabel:
            configureLabel(label: label, fruit: .banana)
        case pineappleAmountLabel:
            configureLabel(label: label, fruit: .pineapple)
        case kiwiAmountLabel:
            configureLabel(label: label, fruit: .kiwi)
        case mangoAmountLabel:
            configureLabel(label: label, fruit: .mango)
        default:
            return
        }
    }
    
    private func configureLabel(label: UILabel, fruit: Fruit) {
        let defaultStocks = juiceMaker.fruitStore.stocks
        
        if let amount = defaultStocks[fruit] {
            label.text = String(amount)
        }
    }
    
    private func takeOrder(sender: UIButton) -> JuiceMaker.Menu {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            return .strawberryBanana
        case mangoKiwiJuiceOrderButton:
            return .mangoKiwi
        case strawberryJucieOrderButton:
            return .strawberry
        case bananaJuiceOrderButton:
            return .banana
        case pineappleJuiceOrderButton:
            return .pineapple
        case kiwiJuiceOrderButton:
            return .kiwi
        case mangoJuiceOrderButton:
            return .mango
        default:
            return .strawberry
        }
    }
}

