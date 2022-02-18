//
//  StockManageViewController.swift
//  JuiceMaker
//
//  Created by 추니 & Davy.
//

import UIKit

class StockManageViewController: UIViewController {
    var fruitStore: FruitStore?
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }

    private func configureUI() {
        strawberryStock.text = "\(fruitStore?.store[.strawberry] ?? 0)"
        bananaStock.text = "\(fruitStore?.store[.banana] ?? 0)"
        pineappleStock.text = "\(fruitStore?.store[.pineapple] ?? 0)"
        kiwiStock.text = "\(fruitStore?.store[.kiwi] ?? 0)"
        mangoStock.text = "\(fruitStore?.store[.mango] ?? 0)"
    }

    private func configureNavigationBar() {
        self.title = "재고 추가"
        let navigationItem = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(tapCloseButton))
        self.navigationItem.rightBarButtonItem  = navigationItem
    }
    
    @objc private func tapCloseButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
