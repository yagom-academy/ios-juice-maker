//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/25.
//

import UIKit

class StockModifyViewController: UIViewController {
    var juiceMaker: JuiceMaking? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func modifyCompleteButtonDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
