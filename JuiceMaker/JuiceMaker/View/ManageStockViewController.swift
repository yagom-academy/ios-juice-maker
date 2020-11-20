//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/20.
//

import UIKit

class ManageStockViewController: UIViewController {
    
    @IBOutlet weak var fruitStockStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "재고 추가"
        
        let dissmissButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(onClickDismiss))
        self.navigationItem.rightBarButtonItem = dissmissButton
    }
    
    @objc func onClickDismiss() {
        self.dismiss(animated: true, completion: nil)
    }

}
