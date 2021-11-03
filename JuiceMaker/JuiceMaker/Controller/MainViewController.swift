//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    private let fruitStore = FruitStore()
    private let juiceMaker = JuiceMaker()
    
    override func viewWillAppear(_ animated: Bool) {
        updateFruitStockLabel()
    }
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private func updateFruitStockLabel() {
        guard let strawberryStock = fruitStore.stock[Fruit.strawberry],
              let bananaStock = fruitStore.stock[Fruit.banana],
              let pineappleStock = fruitStore.stock[Fruit.pineapple],
              let kiwiStock = fruitStore.stock[Fruit.kiwi],
              let mangoStock = fruitStore.stock[Fruit.mango] else {
                  return
              }
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
    
    @IBAction private func touchUpStrawberryBananaJuiceOrder(_ sender: UIButton) {
        order(juice: .strawberryBananaJuice)
    }
    
    @IBAction private func touchUpMangoKiwiJuiceOrder(_ sender: UIButton) {
        order(juice: .mangoKiwiJuice)
    }
    
    @IBAction private func touchUpStrawberryJuiceOrder(_ sender: UIButton) {
        order(juice: .strawberryJuice)
    }
    
    @IBAction private func touchUpBananaJuiceOrder(_ sender: UIButton) {
        order(juice: .bananaJuice)
    }
    
    @IBAction private func touchUpPineappleJuiceOrder(_ sender: UIButton) {
        order(juice: .pineappleJuice)
    }
    
    @IBAction private func touchUpKiwiJuiceOrder(_ sender: UIButton) {
        order(juice: .kiwiJuice)
    }
    
    @IBAction private func touchUpMangoJuiceOrder(_ sender: UIButton) {
        order(juice: .mangoJuice)
    }
    
    private func order(juice: Juice) {
        do {
            try fruitStore.consumeStock(with: juice)
            showSuccessfulOrderAlert(message: "\(juiceMaker.tell(name: juice)) 쥬스 나왔습니다. 맛있게 드세요!")
            updateFruitStockLabel()
        } catch {
            showNoExistStockAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    private func showSuccessfulOrderAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showNoExistStockAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let modifyStockAction = UIAlertAction(title: "재고 수정", style: .default) { (action) in
            guard let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") else { return }
            
            self.present(nextViewController, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(modifyStockAction)
     
        present(alert, animated: true, completion: nil)
    }
}

