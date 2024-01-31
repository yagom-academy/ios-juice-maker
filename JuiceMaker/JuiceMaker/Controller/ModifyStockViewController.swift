//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yejin Hong on 2024/01/24.
//

import UIKit

class ModifyStockViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let closeButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(closeScreen))
        self.navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func closeScreen(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
