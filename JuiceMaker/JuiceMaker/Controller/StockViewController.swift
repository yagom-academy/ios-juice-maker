//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/15.
//

import UIKit

class StockViewController: UIViewController, Storyboardable {
    
    @IBOutlet weak private var viewControllerTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
    }
    
    private func configureTitle() {
        self.viewControllerTitle.text = Navigation.title
    }
    
    @IBAction private func tapCloseButton() {
        self.dismiss(animated: true)
    }
}

extension StockViewController {
    enum Navigation {
        static let title = "재고추가"
    }
}
