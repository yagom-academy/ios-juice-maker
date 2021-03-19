//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 이영우 on 2021/03/19.
//

import UIKit

class StockViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpClosedButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}
