//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by riji, kaki on 2023/01/09.
//

import UIKit

final class ManageStockViewController: UIViewController {

    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateStockLabel()
        initTitle()
        setStepper()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = juiceMaker.currentFruitStock(of: .strawberry).description
        bananaStockLabel.text = juiceMaker.currentFruitStock(of: .banana).description
        pineappleStockLabel.text = juiceMaker.currentFruitStock(of: .pineapple).description
        kiwiStockLabel.text = juiceMaker.currentFruitStock(of: .kiwi).description
        mangoStockLabel.text = juiceMaker.currentFruitStock(of: .mango).description
    }
    
    private func initTitle() {
        let navigationTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        navigationTitle.numberOfLines = 1
        navigationTitle.textAlignment = .center
        navigationTitle.font = UIFont.systemFont(ofSize: 30)
        navigationTitle.text = "재고 추가"
        self.navigationItem.titleView = navigationTitle
    }
    
    private func setStepper() {
        let stepperList: [UIStepper] = [strawberryStepper, bananaStepper, pineappleStepper, kiwiStepper, mangoStepper]
        
        for stepper in stepperList {
            guard let fruit = matchStepperAndFruit(stepper).fruit else { return }
            stepper.value = Double(juiceMaker.currentFruitStock(of: fruit))
        }
        
        stepperList.forEach {
            $0.autorepeat = true
            $0.maximumValue = 150
        }
    }
    
    private func matchStepperAndFruit(_ stepper: UIStepper) -> (fruit: Fruit?, label: UILabel?) {
        switch stepper {
        case strawberryStepper:
            return (.strawberry, strawberryStockLabel)
        case bananaStepper:
            return (.banana, bananaStockLabel)
        case pineappleStepper:
            return (.pineapple, pineappleStockLabel)
        case kiwiStepper:
            return (.kiwi, kiwiStockLabel)
        case mangoStepper:
            return (.mango, mangoStockLabel)
        default:
            return (nil, nil)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name("dismiss"), object: nil)
    }
    
    @IBAction private func stepperTapped(_ sender: UIStepper) {
        guard let fruit = matchStepperAndFruit(sender).fruit,
        let label = matchStepperAndFruit(sender).label else { return }
        label.text = Int(sender.value).description
        FruitStore.sharedFruitStore.fruitStocks[fruit] = Int(sender.value)
    }
    
    @IBAction private func closeViewBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
