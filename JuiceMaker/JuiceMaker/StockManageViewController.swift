//
//  StockManageViewController.swift
//  JuiceMaker
//
//  Created by Yeon on 2020/11/19.
//

import Foundation
import UIKit

class StockManageViewController: UIViewController {
    
    @IBAction func touchUpGoBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
