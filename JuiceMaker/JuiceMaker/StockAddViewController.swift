//
//  StockAddViewController.swift
//  JuiceMaker
//
//  Created by Sunny on 2021/03/18.
//

import UIKit

class StockAddViewController: UIViewController {
    @IBAction func back(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("deinit")
    }
}

