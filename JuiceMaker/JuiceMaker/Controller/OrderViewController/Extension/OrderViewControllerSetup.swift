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
        guard self.navigationItem.rightBarButtonItem != nil else {
            return
        }
        
        self.navigationItem.rightBarButtonItem?.target = self
        self.navigationItem.rightBarButtonItem?.action = #selector(presentManageStockViewController)
    }
    
    func addFruitStoreObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didChangeStock),
            name: .didChangeStock,
            object: nil
        )
    }
    
}
