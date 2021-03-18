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
    
    @IBAction func touchUpStrawberryJuiceButton(_ sender: UIButton) {
        if juiceMachine.checkStockAvailable(fruit: .strawberry, requestedStock: 16) {
            showAlert(message: "딸기 쥬스 나왔습니다! 맛있게 드세요!")
            juiceMachine.makeFruitJuice(.strawberry)
            stockOfStrawberry.text = String(juiceMachine.checkStock(of: Fruit.strawberry))
        } else {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpBananaJuiceButton(_ sender: UIButton) {
        if juiceMachine.checkStockAvailable(fruit: .banana, requestedStock: 2) {
            showAlert(message: "바나나 쥬스 나왔습니다! 맛있게 드세요!")
            juiceMachine.makeFruitJuice(.banana)
            stockOfBanana.text = String(juiceMachine.checkStock(of: Fruit.banana))
        } else {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpKiwiJuiceButton(_ sender: UIButton) {
        if juiceMachine.checkStockAvailable(fruit: .kiwi, requestedStock: 3) {
            showAlert(message: "키위 쥬스 나왔습니다! 맛있게 드세요!")
            juiceMachine.makeFruitJuice(.kiwi)
            stockOfKiwi.text = String(juiceMachine.checkStock(of: Fruit.kiwi))
        } else {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpPineappleJuiceButton(_ sender: UIButton) {
        if juiceMachine.checkStockAvailable(fruit: .pineapple, requestedStock: 2) {
            showAlert(message: "파인애플 쥬스 나왔습니다! 맛있게 드세요!")
            juiceMachine.makeFruitJuice(.pineapple)
            stockOfPineapple.text = String(juiceMachine.checkStock(of: Fruit.pineapple))
        } else {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMangoJuiceButton(_ sender: UIButton) {
        if juiceMachine.checkStockAvailable(fruit: .mango, requestedStock: 3) {
            showAlert(message: "망고 쥬스 나왔습니다! 맛있게 드세요!")
            juiceMachine.makeFruitJuice(.mango)
            stockOfMango.text = String(juiceMachine.checkStock(of: Fruit.mango))
        } else {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpStrawberryBananaJuiceButton(_ sender: UIButton) {
        if juiceMachine.checkStockAvailable(fruit: .strawberry, requestedStock: 10) && juiceMachine.checkStockAvailable(fruit: .banana, requestedStock: 1) {
            showAlert(message: "딸바 쥬스 나왔습니다! 맛있게 드세요!")
            juiceMachine.makeFruitJuice(.strawberryBanana)
            stockOfStrawberry.text = String(juiceMachine.checkStock(of: Fruit.strawberry))
            stockOfBanana.text = String(juiceMachine.checkStock(of: Fruit.banana))
        } else {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMangoKiwiJuiceButton(_ sender: UIButton) {
        if juiceMachine.checkStockAvailable(fruit: .mango, requestedStock: 2) && juiceMachine.checkStockAvailable(fruit: .kiwi, requestedStock: 1) {
            showAlert(message: "망고키위 쥬스 나왔습니다! 맛있게 드세요!")
            juiceMachine.makeFruitJuice(.mangoKiwi)
            stockOfMango.text = String(juiceMachine.checkStock(of: Fruit.mango))
            stockOfKiwi.text = String(juiceMachine.checkStock(of: Fruit.kiwi))
        } else {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
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

