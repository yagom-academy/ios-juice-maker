//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by 전민수 on 2022/05/05.
//

import UIKit

class FruitStockViewController: UIViewController {

    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.topItem?.title = "닫기"
    }
    
    @IBAction func close(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }

}
