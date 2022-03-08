//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 원툴, 두두 on 2022/03/01.
//

import UIKit

class StockViewController: UIViewController {
    private var stock: [Fruit: Int]
    
    init?(coder: NSCoder, stock: [Fruit: Int]) {
        self.stock = stock
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with code")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initalizeViewController()
    }
    
    private func initalizeViewController() {
        title = "재고 추가"
        
        let closeButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = closeButton
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
}
