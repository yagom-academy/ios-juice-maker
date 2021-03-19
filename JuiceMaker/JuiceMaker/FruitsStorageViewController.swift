//
//  FruitsStorageViewController.swift
//  JuiceMaker
//
//  Created by TORI on 2021/03/18.
//

import UIKit

class FruitsStorageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    
    @IBAction func closeToFruitsStorage(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
