//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fruitStack: UIStackView!
    @IBOutlet weak var multiJuiceStack: UIStackView!
    @IBOutlet weak var singleJuiceStack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setFruitStack()
        setJuiceStack()
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

    private func setJuiceStack() {
        let recipes: [JuicesName : Juice] = JuiceMaker.shared.getJuices()
        
        for (key: juiceName, value: juice) in recipes {
            let juiceButton = JuiceButton(title: juice.name.rawValue)
            juiceButton.translatesAutoresizingMaskIntoConstraints = false
            
            if juice.type == .multi {
                multiJuiceStack.addArrangedSubview(juiceButton)
            }
            else {
                singleJuiceStack.addArrangedSubview(juiceButton)
            }
        }
    }
}

