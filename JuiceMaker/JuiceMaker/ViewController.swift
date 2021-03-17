//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock : UILabel!
    @IBOutlet weak var pineappleStock : UILabel!
    @IBOutlet weak var kiwiStock : UILabel!
    @IBOutlet weak var mangoStock : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nowStocks()
//        print(String(juicemaker.fruitStocks.check(fruit: ObjectIdentifier(Strawberry.self))))
    }
    
    func showSuccesAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAtion = UIAlertAction(title: "OK", style: .default) {
            (action) in self.nowStocks()
        }
        alert.addAction(okAtion)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let yesAtion = UIAlertAction(title: "예", style: .default)
        let noAtion = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(yesAtion)
        alert.addAction(noAtion)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchStrawberryJuiceButton(_ juiceButton: UIButton) {
        print("딸기쥬스 버튼을 눌렀습니다")
        let orderState: ErrorMessage = juiceMaker.order(juice: ObjectIdentifier(StrawberryJuice.self))
        print("orderState의 상태 : \(orderState)")
        switch orderState {
        case .completeMakeJuice:
            showSuccesAlert(message: "딸기쥬스가 완성되었습니다. 맛있게 드세요")
        default:
            showFailAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchBananaJuiceButton(_ juiceButton: UIButton) {
        print("바나나쥬스 버튼을 눌렀습니다")
        let orderState: ErrorMessage = juiceMaker.order(juice: ObjectIdentifier(BananaJuice.self))
        print("orderState의 상태 : \(orderState)")
        switch orderState {
        case .completeMakeJuice:
            showSuccesAlert(message: "바나나쥬스가 완성되었습니다. 맛있게 드세요")
        default:
            showFailAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchPineappleJuiceButton(_ juiceButton: UIButton) {
        print("파인애플쥬스 버튼을 눌렀습니다")
        let orderState: ErrorMessage = juiceMaker.order(juice: ObjectIdentifier(PineappleJuice.self))
        print("orderState의 상태 : \(orderState)")
        switch orderState {
        case .completeMakeJuice:
            showSuccesAlert(message: "파인애플쥬스가 완성되었습니다. 맛있게 드세요")
        default:
            showFailAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchKiwiJuiceButton(_ juiceButton: UIButton) {
        print("키위쥬스 버튼을 눌렀습니다")
        let orderState: ErrorMessage = juiceMaker.order(juice: ObjectIdentifier(KiwiJuice.self))
        print("orderState의 상태 : \(orderState)")
        switch orderState {
        case .completeMakeJuice:
            showSuccesAlert(message: "키위쥬스가 완성되었습니다. 맛있게 드세요")
        default:
            showFailAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchMangoJuiceButton(_ juiceButton: UIButton) {
        print("망고쥬스 버튼을 눌렀습니다")
        let orderState: ErrorMessage = juiceMaker.order(juice: ObjectIdentifier(MangoJuice.self))
        print("orderState의 상태 : \(orderState)")
        switch orderState {
        case .completeMakeJuice:
            showSuccesAlert(message: "망고쥬스가 완성되었습니다. 맛있게 드세요")
        default:
            showFailAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchStrawberryBananaJuiceButton(_ juiceButton: UIButton) {
        print("딸바쥬스 버튼을 눌렀습니다")
        let orderState: ErrorMessage = juiceMaker.order(juice: ObjectIdentifier(StrawberryBananaJuice.self))
        print("orderState의 상태 : \(orderState)")
        switch orderState {
        case .completeMakeJuice:
            showSuccesAlert(message: "딸바쥬스가 완성되었습니다. 맛있게 드세요")
        default:
            showFailAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchMangoKiwiJuiceButton(_ juiceButton: UIButton) {
        print("망고키위쥬스 버튼을 눌렀습니다")
        let orderState: ErrorMessage = juiceMaker.order(juice: ObjectIdentifier(MangoKiwiJuice.self))
        print("orderState의 상태 : \(orderState)")
        switch orderState {
        case .completeMakeJuice:
            showSuccesAlert(message: "망고키위쥬스가 완성되었습니다. 맛있게 드세요")
        default:
            showFailAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func nowStocks() {
        strawberryStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Strawberry.self)))
        bananaStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Banana.self)))
        pineappleStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Pineapple.self)))
        kiwiStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Kiwi.self)))
        mangoStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Mango.self)))
    }
    
    
}

