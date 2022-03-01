//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by marisol, mmim on 2022/02/28.
//

import UIKit

class StockViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
