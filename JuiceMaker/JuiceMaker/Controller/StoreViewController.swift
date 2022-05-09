//
//  StoreViewController.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/05/02.
//

import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func strawberryStepperDidTapped(_ sender: UIStepper) {
    }
    
    @IBAction func bananaStepperDidTapped(_ sender: UIStepper) {
    }
    
    @IBAction func pineappleStepperDidTapped(_ sender: UIStepper) {
    }
    
    @IBAction func kiwiStepperDidTapped(_ sender: UIStepper) {
    }
    
    @IBAction func mangoStepperDidTapped(_ sender: UIStepper) {
    }
}
