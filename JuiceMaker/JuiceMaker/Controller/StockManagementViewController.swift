//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/15.
//

import UIKit

final class StockManagementViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goBackPreviousView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
