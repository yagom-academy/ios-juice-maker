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
    
    private var fruitViews: [FruitView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitStock), name: Notification.Name(rawValue: "setStock"), object: nil)
        
        setFruitStack()
        setJuiceStack()
    }
    
    @objc func updateFruitStock() throws {
        let fruits = JuiceMaker.shared.getFruits()
        
        for fruitView in fruitViews {
            guard let fruitType = fruitView.fruit,
                  let fruitStock = fruits[fruitType]?.stock else {
                throw JuiceMakerError.getStock
            }
            
            fruitView.fruitStock.text = String(fruitStock)
        }
    }

    private func setFruitStack() {
        let fruits: [FruitsType : Fruit] = JuiceMaker.shared.getFruits()
        
        for (key: fruitName, value: fruit) in fruits {
            let fruitView = FruitView(fruit: fruit.fruitType)
            fruitView.translatesAutoresizingMaskIntoConstraints = false
            fruitStack.addArrangedSubview(fruitView)
            fruitView.widthAnchor.constraint(equalTo: fruitView.heightAnchor, multiplier: 1.0).isActive = true
            fruitView.fruitName.text = fruitName.getName()
            fruitView.fruitStock.text = String(fruit.stock)
            
            fruitViews.append(fruitView)
        }
    }

    private func setJuiceStack() {
        let juices: [Juices] = JuiceMaker.shared.getJuices()
        
        for juice in juices {
            
            let info = juice.getJuiceInfo()
            
            let juiceButton = JuiceButton(juice: juice, name: info.name)
            juiceButton.translatesAutoresizingMaskIntoConstraints = false
            if info.type == .multi {
                multiJuiceStack.addArrangedSubview(juiceButton)
            }
            else {
                singleJuiceStack.addArrangedSubview(juiceButton)
            }
            juiceButton.addTarget(self, action: #selector(makeJuice(sender:)), for: .touchUpInside)
        }
    }
    
    @objc func makeJuice(sender: JuiceButton) throws {
        guard let juice = sender.juice else {
            throw JuiceMakerError.system
        }
        
        do {
            try JuiceMaker.shared.choiceJuice(juice: juice)
            successJuiceAlert(juice: juice)
        } catch JuiceMakerError.outOfStock {
            outOfStockError(.outOfStock)
        } catch {
            present(self.errorAlert(error, handler: nil), animated: false, completion: nil)
        }
    }
    
    @IBAction func moveManageStock() {
        let manageStockViewController = UINavigationController(rootViewController: ManageStockViewController())
        self.present(manageStockViewController, animated: true, completion: nil)
    }
    
    func successJuiceAlert(juice: Juices) {
        let alert = UIAlertController(title: nil, message: "\(juice.getJuiceInfo().name) 나왔습니다!\n맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: false, completion: nil)
    }
    
    func outOfStockError(_ error: JuiceMakerError) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            self.moveManageStock()
        }
        let cancleAction = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        
        present(alert, animated: false, completion: nil)
    }
}

