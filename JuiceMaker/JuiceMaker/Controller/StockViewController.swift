//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by marisol, mmim on 2022/02/28.
//

import UIKit

final class StockViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
