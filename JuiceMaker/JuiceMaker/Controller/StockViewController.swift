//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/15.
//

import UIKit

class StockViewController: UIViewController {
    
    var fruitStockLabels: [String?]
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
    
    init?(fruitStockLabels: [String?], coder:NSCoder) {
        self.fruitStockLabels = fruitStockLabels
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
        self.strawberryStockLabel.text = self.fruitStockLabels[0]
        self.bananaStockLabel.text = self.fruitStockLabels[1]
        self.pineappleStockLabel.text = self.fruitStockLabels[2]
        self.kiwiStockLabel.text = self.fruitStockLabels[3]
        self.mangoStockLabel.text = self.fruitStockLabels[4]
    }
    
    private func configureStepper() {
        self.strawberryStepper.value = self.fruitStockLabels[0].toDouble ?? 0.0
        self.bananaStepper.value = self.fruitStockLabels[1].toDouble ?? 0.0
        self.pineappleStepper.value = self.fruitStockLabels[2].toDouble ?? 0.0
        self.kiwiStepper.value = self.fruitStockLabels[3].toDouble ?? 0.0
        self.mangoStepper.value = self.fruitStockLabels[4].toDouble ?? 0.0
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
        self.delegate?.sendStock(changedStockLabels: [self.strawberryStockLabel.text,
                                                      self.bananaStockLabel.text,
                                                      self.pineappleStockLabel.text,
                                                      self.kiwiStockLabel.text,
                                                      self.mangoStockLabel.text])
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
