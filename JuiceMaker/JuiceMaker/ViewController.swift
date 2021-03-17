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
        // Do any additional setup after loading the view.
        print(juiceMachine.checkStock(of: Fruit.strawberry))
        print(juiceMachine.fruitStocks)
        // 인스턴스.프로퍼티 or 인스턴스.메소드
        // enum은 타입.케이스
        
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
    
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
    
    

