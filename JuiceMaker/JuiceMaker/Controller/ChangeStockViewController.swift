//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/03/03.
//

import UIKit

class ChangeStockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closedButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
