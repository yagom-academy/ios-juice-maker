//
//  SubViewController.swift
//  JuiceMaker
//
//  Created by 사파리 and Red on 2022/03/07.
//

import UIKit

protocol Update: AnyObject {
    func updateModel(stock: [Fruit: Int])
}

class SubViewController: UIViewController {
    var stockNumbers: [Fruit: Int]?
    weak var delegate: Update?

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
    
    @IBAction func matchLabel(with stepper: UIStepper) {
        switch stepper {
        case strawberryStepper:
            strawberryLabel.text = String(format: "%.0f", strawberryStepper.value)
            stockNumbers?[.strawberry] = Int(strawberryStepper.value)
        case bananaStepper:
            bananaLabel.text = String(format: "%.0f", bananaStepper.value)
            stockNumbers?[.banana] = Int(bananaStepper.value)
        case pineappleStepper:
            pineappleLabel.text = String(format: "%.0f", pineappleStepper.value)
            stockNumbers?[.pineapple] = Int(pineappleStepper.value)
        case kiwiStepper:
            kiwiLabel.text = String(format: "%.0f", kiwiStepper.value)
            stockNumbers?[.kiwi] = Int(kiwiStepper.value)
        case mangoStepper:
            mangoLabel.text = String(format: "%.0f", mangoStepper.value)
            stockNumbers?[.mango] = Int(mangoStepper.value)
        default:
            return 
        }
    }
    
    @IBAction func closeView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let stock = stockNumbers else { return }
        delegate?.updateModel(stock: stock)
    }
    
    func updateLabel() {
        guard let stockNumbers = stockNumbers else { return }
        for (fruit, count) in stockNumbers {
            switch fruit {
            case.strawberry:
                strawberryLabel.text = String(count)
                strawberryStepper.value = Double(count)
            case.banana:
                bananaLabel.text = String(count)
                bananaStepper.value = Double(count)
            case.pineapple:
                pineappleLabel.text = String(count)
                pineappleStepper.value = Double(count)
            case.kiwi:
                kiwiLabel.text = String(count)
                kiwiStepper.value = Double(count)
            case.mango:
                mangoLabel.text = String(count)
                mangoStepper.value = Double(count)
                
            }
        }
    }
    


}
