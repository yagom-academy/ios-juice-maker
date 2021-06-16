//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 편대호 on 2021/06/11.
//

import UIKit
enum FruitStepperTag: Int {
    case strawberry = 100
    case banana = 101
    case kiwi = 102
    case pineapple = 103
    case mango = 104
}

class StockModifyViewController: UIViewController {
	
	private var fruitStepper = [Fruit: UIStepper]()
	
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
		
        initializeFruitStepperDictionary()
        initializeStepperTag()
        
        print(fruitStepper)
        
		refreshStockLabel(strawberryStockLabel: strawberryStockLabel, bananaStockLabel: bananaStockLabel, pineappleStockLabel: pineappleStockLabel, kiwiStockLabel: kiwiStockLabel, mangoStockLabel: mangoStockLabel)
    }
    
    func initializeFruitStepperDictionary() {
        fruitStepper[.strawberry] = strawberryStepper
        fruitStepper[.banana] = bananaStepper
        fruitStepper[.kiwi] = kiwiStepper
        fruitStepper[.mango] = mangoStepper
        fruitStepper[.pineapple] = pineappleStepper
    }
    
    func initializeStepperTag() {
        for (fruit, stepper) in fruitStepper {
            switch fruit {
            case .strawberry:
                stepper.tag = FruitStepperTag.strawberry.rawValue
            case .banana:
                stepper.tag = FruitStepperTag.banana.rawValue
            case .kiwi:
                stepper.tag = FruitStepperTag.kiwi.rawValue
            case .pineapple:
                stepper.tag = FruitStepperTag.pineapple.rawValue
            case .mango:
                stepper.tag = FruitStepperTag.mango.rawValue
            }
        }
    }
	
	@IBAction private func touchUpCloseButton(_ sender: UIBarButtonItem) {
        addStocks()
//        presenter.bananaStockLabel?.text = "asdfasd"

//        guard let navigation = presentingViewController as? UINavigationController else {
//            print("네비게이션 널")
//            return
//        }
//        guard let presenter = navigation.pre as? JuiceOrderViewController else {
//            print("프레젠터 널")
//            return
//        }
//
        dismiss(animated: true, completion: nil)
//        print(FruitStore.shared.fruitStocks)
	}
	
	@IBAction private func touchUpFruitStepper(_ sender: UIStepper) {
        let changeStock = UInt(sender.value)
        
        guard let strawberryStock = FruitStore.shared.fruitStocks[.strawberry],
              let bananaStock = FruitStore.shared.fruitStocks[.banana],
              let kiwiStock = FruitStore.shared.fruitStocks[.kiwi],
              let pineappleStock = FruitStore.shared.fruitStocks[.pineapple],
              let mangoStock = FruitStore.shared.fruitStocks[.mango] else { return }
        
        switch sender.tag {
        case FruitStepperTag.strawberry.rawValue:
            strawberryStockLabel.text = "\(strawberryStock + changeStock)"
        case FruitStepperTag.banana.rawValue:
            bananaStockLabel.text = "\(bananaStock + changeStock)"
        case FruitStepperTag.kiwi.rawValue:
            kiwiStockLabel.text = "\(kiwiStock + changeStock)"
        case FruitStepperTag.pineapple.rawValue:
            pineappleStockLabel.text = "\(pineappleStock + changeStock)"
        case FruitStepperTag.mango.rawValue:
            mangoStockLabel.text = "\(mangoStock + changeStock)"
        default: break
        }
	}
	
	private func addStocks() {
		for (fruit, stepper) in fruitStepper {
			FruitStore.shared.add(fruit: fruit, number: UInt(stepper.value))
		}
	}
	
}
