//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by hemg on 2023/05/15.
//

import UIKit

class ChangeStockViewController: UIViewController {

    @IBOutlet weak var changeConfirm: UIBarButtonItem!
    @IBOutlet weak var strawBerry: UILabel!
    @IBOutlet weak var banana: UILabel!
    @IBOutlet weak var pineapple: UILabel!
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var mango: UILabel!
    
    @IBOutlet weak var strawBerryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeConfirm(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func strawBerryStepper(_ sender: UIStepper) {
        strawBerry.text = Int(sender.value).description
    }
    
    @IBAction func bananaStepper(_ sender: UIStepper) {
        banana.text = Int(sender.value).description
    }
    
    @IBAction func pineappleStepper(_ sender: UIStepper) {
        pineapple.text = Int(sender.value).description
    }
    
    @IBAction func kiwiStepper(_ sender: UIStepper) {
        kiwi.text = Int(sender.value).description
    }
    
    @IBAction func mangoStepper(_ sender: UIStepper) {
        mango.text = Int(sender.value).description
    }
    
    
}
