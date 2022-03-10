//
//  SubViewController.swift
//  JuiceMaker
//
//  Created by 사파리 and Red on 2022/03/07.
//

import UIKit

protocol Updateable: AnyObject {
    func update(for stock: [Fruit: Int])
}

protocol Delegator: AnyObject {
    var stock: [Fruit: Int]? { get set }
    var delegate: Updateable? { get set }
}

class ManagingStockViewController: UIViewController, Delegator {
    var stock: [Fruit: Int]?
    weak var delegate: Updateable?
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    lazy var uiGroup: [Fruit: (label: UILabel, stepper: UIStepper)] = [.strawberry: (strawberryLabel, strawberryStepper),
                                                                            .banana: (bananaLabel, bananaStepper),
                                                                            .pineapple: (pineappleLabel, pineappleStepper),
                                                                            .kiwi: (kiwiLabel, kiwiStepper),
                                                                            .mango: (mangoLabel, mangoStepper)]
    

    @IBAction func matchLabel(with stepper: UIStepper) {
        guard let fruit = Fruit(rawValue: stepper.tag) else { return }
        uiGroup[fruit]?.label.text = String(format: "%.0f", stepper.value)
        stock?[fruit] = Int(stepper.value)
    }
    
    @IBAction func closeView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    private func initializeViewValue() {
        guard let stock = stock else { return }
        for (fruit, amount) in stock {
            setUpViewValue(fruit, amount)
        }
    }
    
    private func setUpViewValue(_ fruit: Fruit, _ amount: Int) {
        uiGroup[fruit]?.label.text = String(amount)
        uiGroup[fruit]?.stepper.value = Double(amount)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewValue()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let stock = stock else { return }
        delegate?.update(for: stock)
    }
}
