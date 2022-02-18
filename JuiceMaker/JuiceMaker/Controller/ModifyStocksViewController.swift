//
//  ModifyStocksViewController.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/16.
//

import UIKit

class ModifyStocksViewController: UIViewController {

    // MARK: - Outlet Property
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    // MARK: - Property
    var juiceMaker: JuiceMaker?
    private var fruitsLabels: [Fruit: UILabel] = [:]
    private var fruitsSteppers: [Fruit: UIStepper] = [:]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitLabels()
        setFruitSteppers()
        setSteppersOptions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        patchData()
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - func
    private func setFruitLabels() {
        fruitsLabels = [.strawberry: strawberryCountLabel,
                        .banana: bananaCountLabel,
                        .pineapple: pineappleCountLabel,
                        .kiwi: kiwiCountLabel,
                        .mango: mangoCountLabel]
    }
    
    private func setFruitSteppers() {
        fruitsSteppers = [.strawberry: strawberryStepper,
                          .banana: bananaStepper,
                          .pineapple: pineappleStepper,
                          .kiwi: kiwiStepper,
                          .mango: mangoStepper]
    }
    
    private func patchData() {
        for fruitLabel in fruitsLabels {
            guard let fruitCount = juiceMaker?.getFruitCount(fruit: fruitLabel.key) else {
                return
            }
            fruitLabel.value.text = "\(fruitCount)"
        }
    }
    
    private func setSteppersOptions() {
        for fruitStepper in fruitsSteppers {
            fruitStepper.value.minimumValue = 0
            
            fruitStepper.value.value =  Double((juiceMaker?.getFruitCount(fruit: fruitStepper.key))!)
        }
    }
    
    // MARK: - Action
    @IBAction func closeButtonTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func strawberryStepperTap(_ sender: UIStepper) {
        strawberryCountLabel.text = "\(Int(sender.value).description)"
        juiceMaker?.setFruitCountPlusOrMinusOne(numberOf: Int(sender.value), fruit: .strawberry)
    }
    
    @IBAction func bananaStepperTap(_ sender: UIStepper) {
        bananaCountLabel.text = "\(Int(sender.value).description)"
        juiceMaker?.setFruitCountPlusOrMinusOne(numberOf: Int(sender.value), fruit: .banana)
    }
    
    @IBAction func pineappleStepperTap(_ sender: UIStepper) {
        pineappleCountLabel.text = "\(Int(sender.value).description)"
        juiceMaker?.setFruitCountPlusOrMinusOne(numberOf: Int(sender.value), fruit: .pineapple)
    }
    
    @IBAction func kiwiStepperTap(_ sender: UIStepper) {
        kiwiCountLabel.text = "\(Int(sender.value).description)"
        juiceMaker?.setFruitCountPlusOrMinusOne(numberOf: Int(sender.value), fruit: .kiwi)
    }
    
    @IBAction func mangoStepperTap(_ sender: UIStepper) {
        mangoCountLabel.text = "\(Int(sender.value).description)"
        juiceMaker?.setFruitCountPlusOrMinusOne(numberOf: Int(sender.value), fruit: .mango)
    }
}
