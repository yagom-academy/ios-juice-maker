//
//  ManageStockViewControllerSetup.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

extension ManageStockViewController {
    
    func setupBarItem() {
        let dismissButton: UIBarButtonItem = UIBarButtonItem(title: "닫기", image: nil, primaryAction: nil, menu: nil)
        self.navigationItem.rightBarButtonItem = dismissButton
    }
    
}
