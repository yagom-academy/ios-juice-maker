//
//  FixStockViewController.swift
//  JuiceMaker
//
//  Created by 오승기 on 2021/06/10.
//

import UIKit

class FixStockViewController: UIViewController {
    var fruitStore = FruitStore()
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func strawberryStepper(_ sender: UIStepper) {
    }
    @IBAction func bananaStepper(_ sender: UIStepper) {
    }
    @IBAction func pineappleStepper(_ sender: UIStepper) {
    }
    @IBAction func kiwiStepper(_ sender: UIStepper) {
    }
    @IBAction func mangoStepper(_ sender: UIStepper) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
