//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 홍정아 on 2021/06/14.
//

import UIKit

enum StepperError: Error {
    case invalidFruitStepper
}

class FruitStoreViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func findFruit(from sender: UIStepper) throws -> UILabel {
        switch sender {
        case strawberryStepper:
            return strawberryStockLabel
        case bananaStepper:
            return bananaStockLabel
        case pineappleStepper:
            return pineappleStockLabel
        case kiwiStepper:
            return kiwiStockLabel
        case mangoStepper:
            return mangoStockLabel
        default:
            throw StepperError.invalidFruitStepper
        }
    }
    
    @IBAction func fruitStepperTapped(_ sender: UIStepper) {
        guard let fruitStockLabel = try? findFruit(from: sender) else {
            return
        }
        fruitStockLabel.text = Int(sender.value).description
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
