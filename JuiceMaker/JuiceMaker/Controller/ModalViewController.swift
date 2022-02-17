//
//  ModalViewController.swift
//  JuiceMaker
//
//  Created by jiinheo on 2022/02/17.
//

import UIKit

class ModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

