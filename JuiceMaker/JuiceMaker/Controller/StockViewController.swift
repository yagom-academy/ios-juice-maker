//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Lee minyeol on 2023/09/18.
//

import UIKit

class StockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func clickCloseButton(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
}
