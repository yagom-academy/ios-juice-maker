//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/15.
//

import UIKit

class StockViewController: UIViewController, Storyboardable {
    
    var juiceMaker: JuiceMaker?
    
    @IBOutlet weak private var viewControllerTitle: UILabel!
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTitle()
        configureLabel()
    }
    
    private func configureLabel() {
        guard let juiceMaker = juiceMaker else { return }
        
        self.strawberryStockLabel.text = juiceMaker.getStock(fruit: .strawberry).toString
        self.bananaStockLabel.text = juiceMaker.getStock(fruit: .banana).toString
        self.pineappleStockLabel.text = juiceMaker.getStock(fruit: .pineapple).toString
        self.kiwiStockLabel.text = juiceMaker.getStock(fruit: .kiwi).toString
        self.mangoStockLabel.text = juiceMaker.getStock(fruit: .mango).toString
    }
    
    private func configureTitle() {
        self.viewControllerTitle.text = Navigation.title
    }
    
    @IBAction private func tapCloseButton() {
        self.dismiss(animated: true)
    }
    
    @IBAction func tapStepper(_ sender: UIStepper) {
        
    }
}

extension StockViewController {
    enum Navigation {
        static let title = "재고추가"
    }
}
