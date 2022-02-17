//
//  ManageStockViewControllerAction.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

extension ManageStockViewController {
    
    @objc func touchDismissButton() {
        guard let presentingViewController: UIViewController = presentingViewController else {
            return
        }
        
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
}
