//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 편대호 on 2021/06/11.
//

import UIKit

class StockModifyViewController: UIViewController {
	
	private var fruitStepper = [Fruit: UIStepper]()
	private var labelStepper = [UIStepper: UILabel]()
	
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
		
    override func viewDidLoad() {
        super.viewDidLoad()
		fruitStepper[.strawberry] = strawberryStepper
		fruitStepper[.banana] = bananaStepper
		fruitStepper[.kiwi] = kiwiStepper
		fruitStepper[.mango] = mangoStepper
		fruitStepper[.pineapple] = pineappleStepper
		
		labelStepper[strawberryStepper] = strawberryStockLabel
		labelStepper[bananaStepper] = bananaStockLabel
		labelStepper[kiwiStepper] = kiwiStockLabel
		labelStepper[pineappleStepper] = pineappleStockLabel
		labelStepper[mangoStepper] = mangoStockLabel
		
		refreshStockLabel(strawberryStockLabel: strawberryStockLabel, bananaStockLabel: bananaStockLabel, pineappleStockLabel: pineappleStockLabel, kiwiStockLabel: kiwiStockLabel, mangoStockLabel: mangoStockLabel)
    }
	
	@IBAction private func touchUpCloseButton(_ sender: UIBarButtonItem) {
		addStocks()
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction private func touchUpFruitStepper(_ sender: UIStepper) {
		
	}
	
	private func addStocks() {
		for (fruit, stepper) in fruitStepper {
			FruitStore.shared.add(fruit: fruit, number: UInt(stepper.value))
		}
	}
	
}
