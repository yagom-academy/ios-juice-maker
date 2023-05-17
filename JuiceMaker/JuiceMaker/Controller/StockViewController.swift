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
        self.viewControllerTitle.text = "재고추가"
    }
    
    @IBAction private func onTouchCloseButton() {
        self.dismiss(animated: true)
    }
}
