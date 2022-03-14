//
//  SubViewController.swift
//  JuiceMaker
//
//  Created by 사파리 and Red on 2022/03/07.
//

import UIKit

protocol Delegator: AnyObject {
    var stock: [Fruit: Int]? { get set }
    var delegate: Updateable? { get set }
}

class StockViewController: UIViewController, Delegator {
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
        askForChangeAlert()
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
    
}
//Mark: Alert
extension StockViewController {
    private func askForChangeAlert() {
        let alertCountrol = UIAlertController(title: Phrases.noticeTitle.text, message: Phrases.acceptChanges.text, preferredStyle: .alert)
        let moveAction = UIAlertAction(title: Phrases.yes.text, style: .default) {_ in
            guard let stock = self.stock else { return }
            self.delegate?.update(for: stock)
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: Phrases.no.text, style: .destructive) {_ in
            self.dismiss(animated: true, completion: nil)
        }
        alertCountrol.addAction(moveAction)
        alertCountrol.addAction(cancelAction)
        present(alertCountrol, animated: false, completion: nil)
    }
}
