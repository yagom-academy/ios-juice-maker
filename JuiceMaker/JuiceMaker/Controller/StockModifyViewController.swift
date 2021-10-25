//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/25.
//

import UIKit

class StockModifyViewController: UIViewController {
    var juiceMaker: JuiceMaker? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func modifyCompleteButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
