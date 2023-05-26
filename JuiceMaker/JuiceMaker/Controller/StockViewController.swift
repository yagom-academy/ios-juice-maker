//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/15.
//

import UIKit

class StockViewController: UIViewController {
    
    private let receivedFruitStock: [Fruit: Int]
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
    
    init?(currentFruitStock receivedFruitStock: [Fruit: Int], coder:NSCoder) {
        self.receivedFruitStock = receivedFruitStock
        super.init(coder: coder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTitle()
        self.configureLabel()
        self.configureStepper()
        self.configureStepperTag()
    }
    
    private func configureTitle() {
        self.viewControllerTitle.text = Navigation.title
    }
    
    private func configureLabel() {
        self.strawberryStockLabel.text = self.receivedFruitStock[.strawberry]?.toString ?? ""
        self.bananaStockLabel.text = self.receivedFruitStock[.banana]?.toString ?? ""
        self.pineappleStockLabel.text = self.receivedFruitStock[.pineapple]?.toString ?? ""
        self.kiwiStockLabel.text = self.receivedFruitStock[.kiwi]?.toString ?? ""
        self.mangoStockLabel.text = self.receivedFruitStock[.mango]?.toString ?? ""
    }
    
    private func configureStepper() {
        self.strawberryStepper.value = self.receivedFruitStock[.strawberry]?.toDouble ?? 0.0
        self.bananaStepper.value = self.receivedFruitStock[.banana]?.toDouble ?? 0.0
        self.pineappleStepper.value = self.receivedFruitStock[.pineapple]?.toDouble ?? 0.0
        self.kiwiStepper.value = self.receivedFruitStock[.kiwi]?.toDouble ?? 0.0
        self.mangoStepper.value = self.receivedFruitStock[.mango]?.toDouble ?? 0.0
    }
    
    private func configureStepperTag() {
        self.strawberryStepper.tag = FruitTag.strawberry
        self.bananaStepper.tag = FruitTag.banana
        self.pineappleStepper.tag = FruitTag.pineapple
        self.kiwiStepper.tag = FruitTag.kiwi
        self.mangoStepper.tag = FruitTag.mango
    }
    
    @IBAction private func tapCloseButton() {
        self.completeEditStock()
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
    
    private func completeEditStock() {
        self.delegate?.changeStock(
            changedStock: [
                .strawberry: self.strawberryStockLabel.text?.toInt ?? 0,
                .banana: self.bananaStockLabel.text?.toInt ?? 0,
                .pineapple: self.pineappleStockLabel.text?.toInt ?? 0,
                .kiwi: self.kiwiStockLabel.text?.toInt ?? 0,
                .mango: self.mangoStockLabel.text?.toInt ?? 0
            ]
        )
    }
}

extension StockViewController {
    private enum Navigation {
        static let title = "재고추가"
    }
    private enum FruitTag {
        static let strawberry = 0
        static let banana = 1
        static let pineapple = 2
        static let kiwi = 3
        static let mango = 4
    }
}
