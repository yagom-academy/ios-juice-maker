//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let fruitStore = FruitStore.shared
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try updateFruitStockLabel()
        } catch {
            print("없는 과일입니다.")
        }
    }
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    func updateFruitStockLabel() throws {
        guard let strawberryStock = fruitStore.stock[Fruit.strawberry],
                let bananaStock = fruitStore.stock[Fruit.banana],
                let pineappleStock = fruitStore.stock[Fruit.pineapple],
                let kiwiStock = fruitStore.stock[Fruit.kiwi],
                let mangoStock = fruitStore.stock[Fruit.mango] else {
                    throw StockError.noExistFruit
                }
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrder(_ sender: UIButton) {
        orderJuice(juice: .strawberryBananaJuice)
    }
    
    @IBAction func touchUpMangoKiwiJuiceOrder(_ sender: UIButton) {
        orderJuice(juice: .mangoKiwiJuice)
    }
    
    @IBAction func touchUpStrawberryJuiceOrder(_ sender: UIButton) {
        orderJuice(juice: .strawberryJuice)
    }
    
    @IBAction func touchUpBananaJuiceOrder(_ sender: UIButton) {
        orderJuice(juice: .bananaJuice)
    }
    
    @IBAction func touchUpPineappleJuiceOrder(_ sender: UIButton) {
        orderJuice(juice: .pineappleJuice)
    }
    
    @IBAction func touchUpKiwiJuiceOrder(_ sender: UIButton) {
        orderJuice(juice: .kiwiJuice)
    }
    
    @IBAction func touchUpMangoJuiceOrder(_ sender: UIButton) {
        orderJuice(juice: .mangoJuice)
    }
    
    func orderJuice(juice: Juice) {
        do {
            try fruitStore.consumeStock(with: juice)
            showExistStockAlert(message: "\(juice) 쥬스 나왔습니다. 맛있게 드세요!")
            try updateFruitStockLabel()
        } catch {
            showNoExistStockAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func showExistStockAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showNoExistStockAlert(message: String) {
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

