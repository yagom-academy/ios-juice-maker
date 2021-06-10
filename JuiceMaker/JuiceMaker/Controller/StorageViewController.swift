//
//  StorageViewController.swift
//  JuiceMaker
//
//  Created by 홍진태 on 2021/06/10.
//

import UIKit

class StorageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func touchUpDismiss(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
