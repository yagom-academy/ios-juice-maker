//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by yun on 2021/06/17.
//

import UIKit

class StockManagerViewController: UIViewController, LabelUpdatable {
    // MARK: - Properties
    private let stepperMaximumValue: Double = 30
    private let fruitStore: FruitStore = FruitStore.shared
    var labelList = [Fruit: UILabel]()
    
    // MARK: - IBOutlets
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet weak var stawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initStepperMaximumValue()
        initLabelList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabelsText(of: fruitStore)
    }
   
    // MARK: - Methods
    private func initStepperMaximumValue() {
        strawberryStepper.maximumValue = stepperMaximumValue
        bananaStepper.maximumValue =
            stepperMaximumValue
        pineappleStepper.maximumValue = stepperMaximumValue
        kiwiStepper.maximumValue = stepperMaximumValue
        mangoStepper.maximumValue = stepperMaximumValue
    }
    
    private func initLabelList() {
        labelList[.strawberry] = stawberryStockLabel
        labelList[.banana] = bananaStockLabel
        labelList[.pineapple] = pineappleStockLabel
        labelList[.kiwi] = kiwiStockLabel
        labelList[.mango] = mangoStockLabel
    }
    
    // MARK: - IBActions
    @IBAction func touchUpDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeStrawberryStock(_ sender: UIStepper) {
        stawberryStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func changeBananaStock(_ sender: UIStepper) {
        bananaStockLabel.text = String(Int(sender.value))
    }
    
    @IBAction func changePineappleStock(_ sender: UIStepper) {
        pineappleStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func changeKiwiStock(_ sender: UIStepper) {
        kiwiStockLabel.text = Int(sender.value).description
    }
    
    @IBAction func changeMangoStock(_ sender: UIStepper) {
        mangoStockLabel.text = Int(sender.value).description
    }
}
