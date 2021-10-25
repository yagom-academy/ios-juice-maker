//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by 김진태 on 2021/10/25.
//

import UIKit

class FruitStoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
