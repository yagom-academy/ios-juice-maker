//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 원툴, 두두 on 2022/03/01.
//

import UIKit

class StockViewController: UIViewController {
    static let identifier = "StockViewController"
    
    private let stock: [Fruit: Int]
    weak var delegate: UpdateDelegate?
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    init?(coder: NSCoder, stock: [Fruit: Int]) {
        self.stock = stock
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must not use this initalizer")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initalizeViewController()
        initalizeData()
    }
    
    private func initalizeViewController() {
        title = "재고 추가"
        
        let closeButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = closeButton
    }
    
    private func initalizeData() {
        for (fruit, amount) in stock {
            let stepper = findStepper(of: fruit)
            let label = findLabel(of: fruit)
            
            stepper.value = Double(amount)
            label.text = "\(amount)"
        }
    }
    
    @IBAction private func didTapStockEditStepper(_ sender: UIStepper) {
        guard let fruit = findFruit(of: sender) else {
            return
        }
        
        let label = findLabel(of: fruit)
        label.text = "\(Int(sender.value))"
    }
 
    private func findStepper(of fruit: Fruit) -> UIStepper {
        switch fruit {
        case .strawberry:
            return strawberryStepper
        case .kiwi:
            return kiwiStepper
        case .banana:
            return bananaStepper
        case .pineapple:
            return pineappleStepper
        case .mango:
            return mangoStepper
        }
    }
    
    private func findLabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStockLabel
        case .kiwi:
            return kiwiStockLabel
        case .banana:
            return bananaStockLabel
        case .pineapple:
            return pineappleStockLabel
        case .mango:
            return mangoStockLabel
        }
    }
    
    private func findFruit(of stepper: UIStepper) -> Fruit? {
        switch stepper {
        case strawberryStepper:
            return .strawberry
        case kiwiStepper:
            return .kiwi
        case bananaStepper:
            return .banana
        case pineappleStepper:
            return .pineapple
        case mangoStepper:
            return .mango
        default:
            return nil
        }
    }
    
    @objc private func dismissVC() {
        let sendData = makeFruitAmountChangedDictionary()
        delegate?.update(data: sendData)
        dismiss(animated: true)
    }
    
    private func makeFruitAmountChangedDictionary() -> [Fruit: Int] {
        var differenceDictionary: [Fruit: Int] = [:]
        
        Fruit.allCases.forEach { fruit in
            let stepper = findStepper(of: fruit)
            let stepperValue = Int(stepper.value)
            let amount = stock[fruit] ?? .zero
            let difference = stepperValue - amount
            differenceDictionary[fruit] = difference
        }
        
        return differenceDictionary
    }
}
