//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/15.
//

import UIKit

class StockViewController: UIViewController {
    
    var juiceMaker: JuiceMaker
    
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
    
    init?(juiceMaker: JuiceMaker, coder:NSCoder) {
        self.juiceMaker = juiceMaker
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStepperTag()
        configureStepper()
        configureTitle()
        configureLabel()
    }
    
    private func configureLabel() {
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
        self.strawberryStepper.value = juiceMaker.getStock(fruit: .strawberry).toDouble
        self.bananaStepper.value = juiceMaker.getStock(fruit: .banana).toDouble
        self.pineappleStepper.value = juiceMaker.getStock(fruit: .pineapple).toDouble
        self.kiwiStepper.value = juiceMaker.getStock(fruit: .kiwi).toDouble
        self.mangoStepper.value = juiceMaker.getStock(fruit: .mango).toDouble
    }
    
    @IBAction private func tapCloseButton() {
        self.updateStock()
        self.dismiss(animated: true)
    }
    
    @IBAction func tapStepper(_ sender: UIStepper) {
        switch sender.tag {
        case 0:
            self.strawberryStockLabel.text = sender.value.toString
        case 1:
            self.bananaStockLabel.text = sender.value.toString
        case 2:
            self.pineappleStockLabel.text = sender.value.toString
        case 3:
            self.kiwiStockLabel.text = sender.value.toString
        case 4:
            self.mangoStockLabel.text = sender.value.toString
        default:
            return
        }
    }
    
    private func updateStock() {
        let newStock: [Fruit: Int] = [
            .strawberry: self.strawberryStockLabel.unwrappedText.toInt,
            .banana: self.bananaStockLabel.unwrappedText.toInt,
            .pineapple: self.pineappleStockLabel.unwrappedText.toInt,
            .kiwi: self.kiwiStockLabel.unwrappedText.toInt,
            .mango: self.mangoStockLabel.unwrappedText.toInt
        ]
        juiceMaker.updateStock(to: newStock)
    }
}

extension StockViewController {
    enum Navigation {
        static let title = "재고추가"
    }
}
