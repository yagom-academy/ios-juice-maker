//
//  JuiceMaker - StockViewController.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
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
