//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
	
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
	@IBOutlet private weak var strawberryJuiceButton: UIButton!
	@IBOutlet private weak var bananaJuiceButton: UIButton!
	@IBOutlet private weak var kiwiJuiceButton: UIButton!
	@IBOutlet private weak var pineappleJuiceButton: UIButton!
	@IBOutlet private weak var mangoJuiceButton: UIButton!
	@IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
	@IBOutlet private weak var ddalbaJuiceButton: UIButton!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		strawberryJuiceButton.setTitle(JuiceRecipe.strawberry.juiceButtonName, for: .normal)
		bananaJuiceButton.setTitle(JuiceRecipe.banana.juiceButtonName, for: .normal)
		kiwiJuiceButton.setTitle(JuiceRecipe.kiwi.juiceButtonName, for: .normal)
		pineappleJuiceButton.setTitle(JuiceRecipe.pineapple.juiceButtonName, for: .normal)
		mangoKiwiJuiceButton.setTitle(JuiceRecipe.mangoKiwi.juiceButtonName, for: .normal)
		ddalbaJuiceButton.setTitle(JuiceRecipe.ddalba.juiceButtonName, for: .normal)
		mangoJuiceButton.setTitle(JuiceRecipe.mango.juiceButtonName, for: .normal)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		refreshStockLabel()
	}
	
    private func refreshStockLabel() {
        let stocks = FruitStore.shared.fruitStocks
        
        for (fruit, quantity) in stocks {
            switch fruit {
            case .strawberry:
                strawberryStockLabel?.text = "\(quantity)"
            case .banana:
                bananaStockLabel?.text = "\(quantity)"
            case .pineapple:
                pineappleStockLabel?.text = "\(quantity)"
            case .kiwi:
                kiwiStockLabel?.text = "\(quantity)"
            case .mango:
                mangoStockLabel?.text = "\(quantity)"
            }
        }
    }
    
    private func orderJuice(recipe: JuiceRecipe) {
        guard juiceMaker.canMakeJuice(recipe: recipe) else {
            showAlert(message: Message.outOfStock.rawValue, okAction: moveToAddStockView(), cancelAction: cancelAction)
            return
        }
        juiceMaker.makeJuice(recipe: recipe)
        refreshStockLabel()
        showAlert(message: "\(recipe.rawValue)\(Message.orderSuccess.rawValue)", okAction: okAction, cancelAction: nil)
    }
    
    @IBAction private func orderJuice(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case JuiceRecipe.strawberry.juiceButtonName:
            orderJuice(recipe: .strawberry)
        case JuiceRecipe.banana.juiceButtonName:
            orderJuice(recipe: .banana)
        case JuiceRecipe.kiwi.juiceButtonName:
            orderJuice(recipe: .kiwi)
        case JuiceRecipe.mango.juiceButtonName:
            orderJuice(recipe: .mango)
        case JuiceRecipe.pineapple.juiceButtonName:
            orderJuice(recipe: .pineapple)
        case JuiceRecipe.ddalba.juiceButtonName:
            orderJuice(recipe: .ddalba)
        case JuiceRecipe.mangoKiwi.juiceButtonName:
            orderJuice(recipe: .mangoKiwi)
        default: break
        }
    }
}
