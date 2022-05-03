//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by LeeChiheon on 2022/05/03.
//

import UIKit

class FruitStockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
}
