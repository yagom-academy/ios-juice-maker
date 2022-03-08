//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 원툴, 두두 on 2022/03/01.
//

import UIKit

class StockViewController: UIViewController {
    private var stock: [Fruit: Int]
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    init?(coder: NSCoder, stock: [Fruit: Int]) {
        self.stock = stock
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with code")
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
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    @IBAction func didTapStockEditStepper(_ sender: UIStepper) {
        guard let fruit = findFruit(of: sender) else {
            return
        }
        let label = findLabel(of: fruit)
        label.text = "\(Int(sender.value))"
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
}
