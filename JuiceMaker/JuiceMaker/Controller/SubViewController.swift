//
//  SubViewController.swift
//  JuiceMaker
//
//  Created by 사파리 and Red on 2022/03/07.
//

import UIKit

class SubViewController: UIViewController {
    var stockNumbers: [Fruit: Int]?

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
    
    @IBAction func strawberryStockchange(_ sender: UIStepper) {
        strawberryLabel.text = String(format: "%.0f", strawberryStepper.value)
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
