//
//  ModifyStocksViewController.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/16.
//

import UIKit

class ModifyStocksViewController: UIViewController {
    // MARK: - Property
    var juiceMaker: JuiceMaker?
    private var fruitsLabels: [Fruit: UILabel] = [:]
    private var fruitsSteppers: [UIStepper: Fruit] = [:]
    
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
        fruitsSteppers = [strawberryStepper: .strawberry,
                              bananaStepper: .banana,
                           pineappleStepper: .pineapple,
                                kiwiStepper: .kiwi,
                               mangoStepper: .mango]
    }
    
    private func patchData() {
        for (fruit, label) in fruitsLabels {
            guard let fruitCount = juiceMaker?.getFruitCount(fruit: fruit) else {
                return
            }
            label.text = "\(fruitCount)"
        }
    }
    
    private func setSteppersOptions() {
        for (stepper, fruit) in fruitsSteppers {
            setStepperOptions(for: fruit, on: stepper)
            stepper.addTarget(self, action: #selector(stepperTap), for: .valueChanged)
        }
    }
    
    private func setStepperOptions(for fruit: Fruit, on stepper: UIStepper) {
        guard let juiceMaker = juiceMaker else { return }
        stepper.minimumValue = 0
        stepper.value = Double(juiceMaker.getFruitCount(fruit: fruit))
    }
    
    // MARK: - Action
    @objc func stepperTap(_ sender: UIStepper) {
        guard let fruit: Fruit = fruitsSteppers[sender] else {
            makeAlert(title: "Stepper의 매칭이 안되어 있어요. 개발자에게 문의해주세요", completion: nil)
            return
        }
        let stepperValue = Int(sender.value)
        fruitsLabels[fruit]?.text = stepperValue.description
        juiceMaker?.setFruitCountPlusOrMinusOne(numberOf: stepperValue, fruit: fruit)
    }
    
    @IBAction func closeButtonTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
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
}
