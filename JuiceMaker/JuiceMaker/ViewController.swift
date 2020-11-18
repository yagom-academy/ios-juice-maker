//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fruitStack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setFruitStack()
    }

    private func setFruitStack() {
        let fruits: [FruitsType : Fruit] = JuiceMaker.shared.getFruits()
        
        for (key: fruitName, value: fruit) in fruits {
            let fruitView = FruitView()
            fruitView.translatesAutoresizingMaskIntoConstraints = false
            fruitStack.addArrangedSubview(fruitView)
            fruitView.widthAnchor.constraint(equalTo: fruitView.heightAnchor, multiplier: 1.0).isActive = true
            
            fruitView.fruitName.text = fruitName.rawValue
            fruitView.fruitStock.text = String(fruit.stock)
        }
    }

}

