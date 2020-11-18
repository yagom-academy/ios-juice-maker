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
        let juices: [Juice] = JuiceMaker.shared.getJuices()
        
        for juice in juices {
            let juiceButton = JuiceButton(title: juice.name.rawValue, name: juice.name)
            juiceButton.translatesAutoresizingMaskIntoConstraints = false
            
            if juice.type == .multi {
                multiJuiceStack.addArrangedSubview(juiceButton)
            }
            else {
                singleJuiceStack.addArrangedSubview(juiceButton)
            }
            
            juiceButton.addTarget(self, action: #selector(makeJuice(sender:)), for: .touchUpInside)
        }
    }
    
    @objc func makeJuice(sender: JuiceButton) throws {
        guard let juice = sender.juiceName else {
            throw JuiceMakerError.system
        }
        
        do {
            try JuiceMaker.shared.choiceJuice(juice: juice)
            successJuiceAlert(juiceName: juice)
            
        } catch JuiceMakerError.outOfStock {
            outOfStockError()
        } catch JuiceMakerError.notFound {
            notFoundError()
        }
    }
    
    func successJuiceAlert(juiceName: JuicesName) {
        let alert = UIAlertController(title: nil, message: "\(juiceName.rawValue) 나왔습니다!\n맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: false, completion: nil)
    }
    
    func outOfStockError() {
        let alert = UIAlertController(title: nil, message: "재로가 모자라요.\n재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        let cancleAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        
        present(alert, animated: false, completion: nil)
    }
    
    func notFoundError() {
        let alert = UIAlertController(title: "오류", message: "시스템 상 오류가 있습니다.\n잠시 후 다시 시도해 주세요.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: false, completion: nil)
    }
}

