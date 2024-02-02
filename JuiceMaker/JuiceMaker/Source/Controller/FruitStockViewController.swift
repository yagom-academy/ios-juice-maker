//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by HAMZZI, Danny on 1/25/24.
//

import UIKit

class FruitStockViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let closeButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(closeModal))
        self.navigationItem.leftBarButtonItem = closeButton
    }

    @objc func closeModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
