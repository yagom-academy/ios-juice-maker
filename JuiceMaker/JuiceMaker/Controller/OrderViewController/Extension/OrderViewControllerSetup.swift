//
//  OrderViewControllerSetup.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

extension OrderViewController {
    
    func setupRightBarButtonItem() {
        guard let rightBarButtonItem = self.navigationItem.rightBarButtonItem else {
            return
        }
        
        rightBarButtonItem.target = self
        rightBarButtonItem.action = #selector(presentManageStockViewController)
    }
    
}
