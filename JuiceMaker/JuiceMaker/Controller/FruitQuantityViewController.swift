//
//  FruitQuantityViewController.swift
//  JuiceMaker
//
//  Created by 김우현 on 2023/09/19.
//

import UIKit

final class FruitQuantityViewController: UIViewController {
    static let id = String(describing: FruitQuantityViewController.self)
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
