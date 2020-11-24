//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 임리나 on 2020/11/23.
//

import UIKit

class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpDismissPageButton() {
//        guard let stockView = self.presentingViewController else { return }
        
        self.dismiss(animated: true, completion: nil)
    }
}
