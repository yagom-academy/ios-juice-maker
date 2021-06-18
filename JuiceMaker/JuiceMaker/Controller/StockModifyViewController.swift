//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 편대호 on 2021/06/11.
//

import UIKit

class StockModifyViewController: UIViewController {
	
	//MARK:- Properties
	
	private var fruitSteppers = [UIStepper]()
	private var fruitLabels = [UILabel]()
//	private struct previousStocks {
		var previousStrawberryStock: UInt = 0
		var previousBananaStock: UInt = 0
		var previousKiwiStock: UInt = 0
		var previousPineappleStock: UInt = 0
		var previousMangoStock: UInt = 0
//	}
	//MARK:- IBOutlets
	
	@IBOutlet private weak var strawberryStockLabel: UILabel!
	@IBOutlet private weak var bananaStockLabel: UILabel!
	@IBOutlet private weak var pineappleStockLabel: UILabel!
	@IBOutlet private weak var kiwiStockLabel: UILabel!
	@IBOutlet private weak var mangoStockLabel: UILabel!
	
	@IBOutlet private weak var AddStockViewCloseButton: UIBarButtonItem!
	
	@IBOutlet private weak var strawberryStepper: UIStepper!
	@IBOutlet private weak var bananaStepper: UIStepper!
	@IBOutlet private weak var kiwiStepper: UIStepper!
	@IBOutlet private weak var pineappleStepper: UIStepper!
	@IBOutlet private weak var mangoStepper: UIStepper!
		
	//MARK:- IBActions
	
	@IBAction private func touchUpCloseButton(_ sender: UIBarButtonItem) {
		addStocks()
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction private func touchUpFruitStepper(_ sender: UIStepper) {
        
		let changeStock = UInt(sender.value)
		let fruit = Fruit(rawValue: sender.tag)
        
        switch fruit {
        case .strawberry:
            strawberryStockLabel.text = "\(previousStrawberryStock + changeStock)"
        case .banana:
            bananaStockLabel.text = "\(previousBananaStock + changeStock)"
        case .kiwi:
            kiwiStockLabel.text = "\(previousKiwiStock + changeStock)"
        case .pineapple:
            pineappleStockLabel.text = "\(previousPineappleStock + changeStock)"
        case .mango:
            mangoStockLabel.text = "\(previousMangoStock + changeStock)"
        default: break
        }
	}
	
	//MARK:- Life Cycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		fruitLabels = [strawberryStockLabel, bananaStockLabel, kiwiStockLabel, pineappleStockLabel, mangoStockLabel]
		fruitSteppers = [strawberryStepper, bananaStepper, kiwiStepper, pineappleStepper, mangoStepper]
		setFruitLabelsTag(fruitLabels: fruitLabels)
		setStepperTag(fruitSteppers: fruitSteppers)
        
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		refreshStockLabel(fruitLabels: fruitLabels)
        loadPreviousFruitStock()
	}
}

//MARK:- Internal Functions

extension StockModifyViewController {
	
	func setStepperTag(fruitSteppers: [UIStepper]) {
		for (index, fruitStepper) in fruitSteppers.enumerated() {
			fruitStepper.tag = index
		}
	}
}

//MARK:- Private Functions

extension StockModifyViewController {
	
	private func addStocks() {
		for stepper in fruitSteppers {
			guard let fruit = Fruit(rawValue: stepper.tag) else {
				return
			}
			FruitStore.shared.add(fruit: fruit, number: UInt(stepper.value))
		}
	}
    
    private func loadPreviousFruitStock() {
    guard let strawberryStockLabelText = strawberryStockLabel.text, let strawberryStock = UInt(strawberryStockLabelText),
          let bananaStockLabelText = bananaStockLabel.text, let bananaStock = UInt(bananaStockLabelText),
          let kiwiStockLabelText = kiwiStockLabel.text, let kiwiStock = UInt(kiwiStockLabelText),
          let pineappleStockLabelText = pineappleStockLabel.text, let pineappleStock = UInt(pineappleStockLabelText),
          let mangoStockLabelText = mangoStockLabel.text, let mangoStock = UInt(mangoStockLabelText) else {
        return
    }
    previousStrawberryStock = strawberryStock
    previousBananaStock = bananaStock
    previousKiwiStock = kiwiStock
    previousPineappleStock = pineappleStock
    previousMangoStock = mangoStock
    }
}
