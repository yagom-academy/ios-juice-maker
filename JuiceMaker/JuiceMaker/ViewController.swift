//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var fruitCountLabels: [UILabel]!
    @IBOutlet var orderJuiceButtons: [UIButton]!
    
    private var juiceMaker: JuiceMaker?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.juiceMaker = JuiceMaker(
                            fruitManager: FruitManager(
                                fruitsStore: [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]),
            recipes: [.strawberry: [.strawberry: 16], .banana: [.banana: 2], .kiwi: [.kiwi: 3], .pineapple: [.pineapple: 2], .strawberrybanana: [.strawberry: 10, .banana: 1], .mango: [.mango: 3] , .mangokiwi: [.mango: 2, .kiwi: 1]])
        
        self.refreshFruitCountLabel()
    }
    
    /**
     과일 개수를 나타내는 레이블을 갱신하는 함수.
     */
    func refreshFruitCountLabel() {
        let fruitAllCases: [Fruit] = [.strawberry, .banana, .pineapple, .kiwi, .mango]
        
        for (index, fruit) in fruitAllCases.enumerated() {
            guard let fruitCount = self.juiceMaker?.fruitManager.fruitStore[fruit] else {
                print("\(fruit)의 재고 개수를 나타낼 수 없습니다.")
                return
            }
            
            let fruitCountText = String(fruitCount)
            
            self.fruitCountLabels[index].text = fruitCountText
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
     */
    func orderJuice(juice: Juice) {
        do {
            try self.juiceMaker?.make(juice: juice)
            
            self.refreshFruitCountLabel()
        
            self.showAlert(message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", alertAction1: UIAlertAction(title: "확인", style: .default, handler: nil), alertAction2: nil)
        } catch JuiceMakerError.insufficientFruit {
            self.showAlert(message: "재료가 모자라요. 재고를 수정할까요?", alertAction1: UIAlertAction(title: "예", style: .default, handler: { (action) in
                self.performSegue(withIdentifier: "showFruitStore", sender: self)
            }), alertAction2: UIAlertAction(title: "아니오", style: .cancel, handler: nil))
        } catch {
            self.showAlert(message: "쥬스 제조 과정에서 오류가 발생하였습니다.", alertAction1: UIAlertAction(title: "확인", style: .default, handler: nil), alertAction2: nil)
        }
    }
    
    @IBAction func touchUpOrderJucieButton(_ sender: Any) {
        guard let orderJuiceButton = sender as? UIButton else {
            print("터치한 뷰는 버튼이 아닙니다.")
            return
        }
        
        switch orderJuiceButton {
        case orderJuiceButtons[0]:
            orderJuice(juice: Juice.strawberrybanana)
        case orderJuiceButtons[1]:
            orderJuice(juice: Juice.mangokiwi)
        case orderJuiceButtons[2]:
            orderJuice(juice: Juice.strawberry)
        case orderJuiceButtons[3]:
            orderJuice(juice: Juice.banana)
        case orderJuiceButtons[4]:
            orderJuice(juice: Juice.pineapple)
        case orderJuiceButtons[5]:
            orderJuice(juice: Juice.kiwi)
        case orderJuiceButtons[6]:
            orderJuice(juice: Juice.mango)
        default:
            print("버튼에 문제가 있습니다.")
        }
    }
}
