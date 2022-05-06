//
//  stockViewController.swift
//  JuiceMaker
//
//  Created by 오경식 on 2022/05/02.
//

import UIKit

class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapClosedStockViewController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
