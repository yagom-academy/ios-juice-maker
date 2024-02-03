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
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        let closeButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(closeFruitStockModal))
        navigationItem.rightBarButtonItem = closeButton
        navigationBar.setItems([navigationItem], animated: false)
        self.view.addSubview(navigationBar)
    }

    @objc func closeFruitStockModal() {
        self.dismiss(animated: true, completion: nil)
    }
}
