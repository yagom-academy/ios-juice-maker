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
        setFruitStockStack()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "재고 추가"
        
        let dissmissButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(onClickDismiss))
        self.navigationItem.rightBarButtonItem = dissmissButton
    }
    
    @objc func onClickDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setFruitStockStack() {
        let fruits: [FruitsType : Fruit] = JuiceMaker.shared.getFruits()
        
        for (key: fruitName, value: fruit) in fruits {
            let fruitStockView = FruitStockView()
            fruitStockView.translatesAutoresizingMaskIntoConstraints = false
            fruitStockStackView.addArrangedSubview(fruitStockView)
            fruitStockView.widthAnchor.constraint(equalTo: fruitStockView.heightAnchor, multiplier: 0.74).isActive = true
            fruitStockView.fruitView.fruitName.text = fruitName.rawValue
            fruitStockView.fruitView.fruitStock.text = String(fruit.stock)
        }
    }

}
