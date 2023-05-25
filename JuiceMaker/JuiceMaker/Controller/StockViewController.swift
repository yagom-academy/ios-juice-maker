//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/15.
//

import UIKit

typealias FruitStockLabel = (strawberry: String?, banana: String?, pineapple: String?, kiwi: String?, mango: String?)

class StockViewController: UIViewController {
    
    var fruitStockLabel: FruitStockLabel
    var delegate: StockViewControllerDelegate?
    
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
    
    init?(fruitStockLabel: FruitStockLabel, coder:NSCoder) {
        self.fruitStockLabel = fruitStockLabel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureLabel()
        configureStepper()
        configureStepperTag()
    }
    
    private func configureTitle() {
        self.viewControllerTitle.text = Navigation.title
    }
    
    private func configureLabel() {
        self.strawberryStockLabel.text = self.fruitStockLabel.strawberry
        self.bananaStockLabel.text = self.fruitStockLabel.banana
        self.pineappleStockLabel.text = self.fruitStockLabel.pineapple
        self.kiwiStockLabel.text = self.fruitStockLabel.kiwi
        self.mangoStockLabel.text = self.fruitStockLabel.mango
    }
    
    private func configureStepper() {
        self.strawberryStepper.value = self.fruitStockLabel.strawberry.toDouble ?? 0.0
        self.bananaStepper.value = self.fruitStockLabel.banana.toDouble ?? 0.0
        self.pineappleStepper.value = self.fruitStockLabel.pineapple.toDouble ?? 0.0
        self.kiwiStepper.value = self.fruitStockLabel.kiwi.toDouble ?? 0.0
        self.mangoStepper.value = self.fruitStockLabel.mango.toDouble ?? 0.0
    }
    
    private func configureStepperTag() {
        self.strawberryStepper.tag = FruitTag.strawberry
        self.bananaStepper.tag = FruitTag.banana
        self.pineappleStepper.tag = FruitTag.pineapple
        self.kiwiStepper.tag = FruitTag.kiwi
        self.mangoStepper.tag = FruitTag.mango
    }
    
    @IBAction private func tapCloseButton() {
        self.updateStock()
        self.dismiss(animated: true)
    }
    
    @IBAction private func tapStockEditButton(_ sender: UIStepper) {
        switch sender.tag {
        case FruitTag.strawberry:
            self.strawberryStockLabel.text = sender.value.toString
        case FruitTag.banana:
            self.bananaStockLabel.text = sender.value.toString
        case FruitTag.pineapple:
            self.pineappleStockLabel.text = sender.value.toString
        case FruitTag.kiwi:
            self.kiwiStockLabel.text = sender.value.toString
        case FruitTag.mango:
            self.mangoStockLabel.text = sender.value.toString
        default:
            return
        }
    }
    
    private func updateStock() {
        self.delegate?.changeStock(
            changedStock: [
                .strawberry: self.strawberryStockLabel.text.toInt ?? 0,
                .banana: self.bananaStockLabel.text.toInt ?? 0,
                .pineapple: self.pineappleStockLabel.text.toInt ?? 0,
                .kiwi: self.kiwiStockLabel.text.toInt ?? 0,
                .mango: self.mangoStockLabel.text.toInt ?? 0
            ]
        )
    }
    
}

extension StockViewController {
    enum Navigation {
        static let title = "재고추가"
    }
    enum FruitTag {
        static let strawberry = 0
        static let banana = 1
        static let pineapple = 2
        static let kiwi = 3
        static let mango = 4
    }
}
