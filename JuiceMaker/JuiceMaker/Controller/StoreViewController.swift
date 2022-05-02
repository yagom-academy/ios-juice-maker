//
//  StoreViewController.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/05/02.
//

import UIKit

class StoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
