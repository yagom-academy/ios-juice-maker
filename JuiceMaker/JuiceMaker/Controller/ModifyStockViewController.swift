//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by Yejin Hong on 2024/01/24.
//

import UIKit

class ModifyStockViewController: UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
