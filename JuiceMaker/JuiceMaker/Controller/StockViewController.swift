//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by marisol on 2022/02/28.
//

import UIKit

class StockViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
