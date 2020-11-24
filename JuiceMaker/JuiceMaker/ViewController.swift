//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    private var juiceMaker: JuiceMaker?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.juiceMaker = JuiceMaker(fruitManager: FruitManager(fruitsStore: [Fruit.strawberry: 10, Fruit.banana: 10, Fruit.pineapple: 10, Fruit.kiwi: 10, Fruit.mango: 10]), recipes: [Juice.strawberry: [Fruit.strawberry: 16], Juice.banana: [Fruit.banana: 2], Juice.kiwi: [Fruit.kiwi: 3], Juice.pineapple: [Fruit.pineapple: 2], Juice.strawberrybanana: [Fruit.strawberry: 10, Fruit.banana: 1], Juice.mango: [Fruit.mango: 3] ,Juice.mangokiwi: [Fruit.mango: 2, Fruit.kiwi: 1]])
        
        self.refreshFruitCountLabel([Fruit.strawberry, Fruit.banana, Fruit.pineapple, Fruit.kiwi, Fruit.mango])
    }
    
    /**
     과일 개수를 나타내는 레이블을 갱신하는 함수.
     
     - Parameter fruits: 개수를 갱신할 과일
     */
    func refreshFruitCountLabel(_ fruits: [Fruit]) {
        guard let fruitStore = self.juiceMaker?.fruitManager.fruitStore else {
            print("과일저장소를 불러올 수 없어서 과일 개수를 나타낼 수 없습니다.")
            return
        }
        
        for fruit in fruits {
            guard let fruitCount = fruitStore[fruit] else {
                print("\(fruit)은 과일 저장소에서 불러올 수 없는 과일 때문에 과일 개수를 나타낼 수 없습니다.")
                return
            }
            
            let fruitCountText = String(fruitCount)
            
            switch fruit {
            case Fruit.strawberry:
                self.strawberryCountLabel.text = fruitCountText
            case Fruit.banana:
                self.bananaCountLabel.text = fruitCountText
            case Fruit.pineapple:
                self.pineappleCountLabel.text = fruitCountText
            case Fruit.kiwi:
                self.kiwiCountLabel.text = fruitCountText
            case Fruit.mango:
                self.mangoCountLabel.text = fruitCountText
            }
        }
    }
    
    /**
     입력된 메세지를 Alert로 표시하는 함수이며, 최대 두개의 UIAlertAction을 추가할 수 있다.
     
     - Parameters:
        - message:Alert에 표시할 메세지
        - alertAction1: Alert에 추가할 첫번째 액션
        - alertAction2: Alert에 추가할 두번째 액션
     */
    func showAlert(message: String, alertAction1: UIAlertAction?, alertAction2: UIAlertAction?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)

        if let alertAction1 = alertAction1 {
            alert.addAction(alertAction1)
        }
        
        if let alertAction2 = alertAction2 {
            alert.addAction(alertAction2)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    /**
     입력된 쥬스에 맞게 쥬스를 주문하는 함수이며, 입력된 과일에 맞게 과일 재고 레이블을 갱신.
     
     - Parameters:
        - juice: 쥬스 버튼이 터치되면 주문할 쥬스
        - fruits: 재고 레이블을 갱신할 과일
     */
    func touchUpOrderJuiceButton(juice: Juice, fruits: [Fruit]) {
        do {
            try self.juiceMaker?.make(juice: juice)
            
            self.refreshFruitCountLabel(fruits)
        
            self.showAlert(message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", alertAction1: UIAlertAction(title: "확인", style: .default, handler: nil), alertAction2: nil)
        } catch JuiceMakerError.insufficientFruit {
            self.showAlert(message: "재료가 모자라요. 재고를 수정할까요?", alertAction1: UIAlertAction(title: "예", style: .default, handler: { (action) in
                self.performSegue(withIdentifier: "showFruitStore", sender: self)
            }), alertAction2: UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        } catch {
            self.showAlert(message: "쥬스 제조 과정에서 오류가 발생하였습니다.", alertAction1: UIAlertAction(title: "확인", style: .default, handler: nil), alertAction2: nil)
        }
    }

    @IBAction func touchUpOrderStrawberryBananaJuiceButton(_ sender: Any) {
        self.touchUpOrderJuiceButton(juice: Juice.strawberrybanana, fruits: [Fruit.strawberry, Fruit.banana])
    }
    
    @IBAction func touchUpOrderMangoKiwiJuiceButton(_ sender: Any) {
        self.touchUpOrderJuiceButton(juice: Juice.mangokiwi, fruits: [Fruit.mango, Fruit.kiwi])
    }
    
    @IBAction func touchUpOrderStrawberryJuiceButton(_ sender: Any) {
        self.touchUpOrderJuiceButton(juice: Juice.strawberry, fruits: [Fruit.strawberry])
    }
    
    @IBAction func touchUpOrderBananaJuiceButton(_ sender: Any) {
        self.touchUpOrderJuiceButton(juice: Juice.banana, fruits: [Fruit.banana])
    }
    
    @IBAction func touchUpOrderPineappleJuiceButton(_ sender: Any) {
        self.touchUpOrderJuiceButton(juice: Juice.pineapple, fruits: [Fruit.pineapple])
    }
    
    @IBAction func touchUpOrderKiwiJuiceButton(_ sender: Any) {
        self.touchUpOrderJuiceButton(juice: Juice.kiwi, fruits: [Fruit.kiwi])
    }
    
    @IBAction func touchUpOrderMangoJuiceButton(_ sender: Any) {
        self.touchUpOrderJuiceButton(juice: Juice.mango, fruits: [Fruit.mango])
    }
    
}

