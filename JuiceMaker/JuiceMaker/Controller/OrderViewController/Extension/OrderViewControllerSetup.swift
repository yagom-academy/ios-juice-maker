//
//  OrderViewControllerSetup.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

extension OrderViewController {
    
    /// Sets up `self.navigationItem.rightBarButtonItem`
    /// and adds action to it.
    func setupRightBarButtonItem() {
        guard let navagationItem: UINavigationItem = self.navigationItem.rightBarButtonItem != nil else {
            return
        }
        
        navagationItem.target = self
        navagationItem.action = #selector(presentManageStockViewController)
    }
    
}
