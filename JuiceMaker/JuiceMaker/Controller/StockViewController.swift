//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/15.
//

import UIKit

class StockViewController: UIViewController, Storyboardable {
    
    var juiceMaker: JuiceMaker?
    
    @IBOutlet weak private var viewControllerTitle: UILabel!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStepperTag()
        configureStepper()
        configureTitle()
        configureLabel()
    }
    
    private func configureLabel() {
        guard let juiceMaker = juiceMaker else { return }
        
        self.strawberryStockLabel.text = juiceMaker.getStock(fruit: .strawberry).toString
        self.bananaStockLabel.text = juiceMaker.getStock(fruit: .banana).toString
        self.pineappleStockLabel.text = juiceMaker.getStock(fruit: .pineapple).toString
        self.kiwiStockLabel.text = juiceMaker.getStock(fruit: .kiwi).toString
        self.mangoStockLabel.text = juiceMaker.getStock(fruit: .mango).toString
    }
    
    private func configureTitle() {
        self.viewControllerTitle.text = Navigation.title
    }
    
    private func configureStepperTag() {
        self.strawberryStepper.tag = 0
        self.bananaStepper.tag = 1
        self.pineappleStepper.tag = 2
        self.kiwiStepper.tag = 3
        self.mangoStepper.tag = 4
    }
    
    private func configureStepper() {
        guard let juiceMaker = juiceMaker else { return }
        
        self.strawberryStepper.value = Double(juiceMaker.getStock(fruit: .strawberry))
        self.bananaStepper.value = Double(juiceMaker.getStock(fruit: .banana))
        self.pineappleStepper.value = Double(juiceMaker.getStock(fruit: .pineapple))
        self.kiwiStepper.value = Double(juiceMaker.getStock(fruit: .kiwi))
        self.mangoStepper.value = Double(juiceMaker.getStock(fruit: .mango))
    }
    
    @IBAction private func tapCloseButton() {
        self.dismiss(animated: true)
    }
    
    @IBAction func tapStepper(_ sender: UIStepper) {
        let fruit = findFruit(identifier: sender.tag)
        juiceMaker?.updateStock(fruit: fruit, amount: Int(sender.value))
        configureLabel()
    }
    
    func findFruit(identifier: Int) -> Fruit {
        switch identifier {
        case 0:
            return .strawberry
        case 1:
            return .banana
        case 2:
            return .pineapple
        case 3:
            return .kiwi
        case 4:
            return .mango
        default:
            return .none
        }
    }
}

extension StockViewController {
    enum Navigation {
        static let title = "재고추가"
    }
}
