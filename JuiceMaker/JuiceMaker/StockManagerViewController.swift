//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by 배은서 on 2021/03/15.
//

import UIKit

class StockManagerViewController: UIViewController {
    @IBOutlet weak var closeButton: UIBarButtonItem!
    
    @IBAction func touchUpCloseButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
