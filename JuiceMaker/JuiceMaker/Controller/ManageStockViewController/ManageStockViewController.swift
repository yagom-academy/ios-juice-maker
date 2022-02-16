//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

class ManageStockViewController: UIViewController {
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInit()
    }
    
    // MARK: - Common Initialize
    
    private func commonInit() {
        self.title = "재고 추가"
        self.setupBarItem()
    }

}
