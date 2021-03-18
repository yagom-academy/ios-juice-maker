//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineapple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    let juiceMachine: JuiceMaker = JuiceMaker(numberOfStocks: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockOfStrawberry.text = String(juiceMachine.checkStock(of: Fruit.strawberry))
        stockOfBanana.text = String(juiceMachine.checkStock(of: Fruit.banana))
        stockOfPineapple.text = String(juiceMachine.checkStock(of: Fruit.pineapple))
        stockOfKiwi.text = String(juiceMachine.checkStock(of: Fruit.kiwi))
        stockOfMango.text = String(juiceMachine.checkStock(of: Fruit.mango))
    }
    // 재고를 확인하고 쥬스 만들기
    func checkStockAndMakeJuice(_ juiceType: FruitJuice) {
        print(juiceType.recipe)
        
        for (ingredient, amount) in juiceType.recipe {
            if juiceMachine.checkStockAvailable(fruit: ingredient, requestedStock: amount) == false {
                showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
                return
            }
        }
        
        showAlert(message: "\(juiceType.rawValue) 쥬스 나왔습니다! 맛있게 드세요!")
        juiceMachine.makeFruitJuice(juiceType)
        
        for (ingredient, _) in juiceType.recipe {
            updateStockLabel(fruit: ingredient)
        }
    }
    
    func updateStockLabel(fruit: Fruit) {
        switch fruit {
        case .strawberry:
            stockOfStrawberry.text = String(juiceMachine.checkStock(of: .strawberry))
        case .banana:
            stockOfBanana.text = String(juiceMachine.checkStock(of: .banana))
        case .kiwi:
            stockOfKiwi.text = String(juiceMachine.checkStock(of: .kiwi))
        case .mango:
            stockOfMango.text = String(juiceMachine.checkStock(of: .mango))
        case .pineapple:
            stockOfPineapple.text = String(juiceMachine.checkStock(of: .pineapple))
        }
    }
    
    @IBAction func touchUpStrawberryJuiceButton(_ sender: UIButton) {
        checkStockAndMakeJuice(.strawberry)
    }
    
    @IBAction func touchUpBananaJuiceButton(_ sender: UIButton) {
        checkStockAndMakeJuice(.banana)
    }
    
    @IBAction func touchUpKiwiJuiceButton(_ sender: UIButton) {
        checkStockAndMakeJuice(.kiwi)
    }
    
    @IBAction func touchUpPineappleJuiceButton(_ sender: UIButton) {
        checkStockAndMakeJuice(.pineapple)
    }
    
    @IBAction func touchUpMangoJuiceButton(_ sender: UIButton) {
        checkStockAndMakeJuice(.mango)
    }
    
    @IBAction func touchUpStrawberryBananaJuiceButton(_ sender: UIButton) {
        checkStockAndMakeJuice(.strawberryBanana)
    }
    
    @IBAction func touchUpMangoKiwiJuiceButton(_ sender: UIButton) {
        checkStockAndMakeJuice(.mangoKiwi)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let stockAddAction = UIAlertAction(title: "예", style: .default) { (action) in
            guard let svc = self.storyboard?.instantiateViewController(withIdentifier: "StockAdd") else { return }
            svc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(svc, animated: true, completion: nil)
        }
        
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        
        if message == "재료가 모자라요. 재고를 수정할까요?" {
            alert.addAction(cancelAction)
            alert.addAction(stockAddAction)
            present(alert, animated: true, completion: nil)
        } else {
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    

    

}

