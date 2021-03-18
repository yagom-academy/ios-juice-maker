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
        
        nowStocks()
    }
    
    func nowStocks() {
        strawberryStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Strawberry.self)))
        bananaStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Banana.self)))
        pineappleStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Pineapple.self)))
        kiwiStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Kiwi.self)))
        mangoStock.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Mango.self)))
    }
    
    @IBAction func matchButton(sender: AnyObject) {
        guard let button = sender as? UIButton else{
            return
        }
        
        switch button.tag {
        case 1:
            juiceButton(ObjectIdentifier(StrawberryJuice.self), "딸기쥬스")
        case 2:
            juiceButton(ObjectIdentifier(BananaJuice.self), "바나나쥬스")
        case 3:
            juiceButton(ObjectIdentifier(PineappleJuice.self), "파인애플쥬스")
        case 4:
            juiceButton(ObjectIdentifier(KiwiJuice.self), "키위쥬스")
        case 5:
            juiceButton(ObjectIdentifier(MangoJuice.self), "망고쥬스")
        case 6:
            juiceButton(ObjectIdentifier(StrawberryBananaJuice.self), "딸바쥬스")
        case 7:
            juiceButton(ObjectIdentifier(MangoKiwiJuice.self), "망고키위쥬스")
        default:
            print("모르는 버튼")
        }
    }
    
    func juiceButton(_ juiceRecipe: ObjectIdentifier, _ juiceName: String) {
                let orderState: ErrorMessage = juiceMaker.order(juice: juiceRecipe)
                print("orderState의 상태 : \(orderState)")
                switch orderState {
                case .completeMakeJuice:
                    showSuccessAlert(message: juiceName)
                default:
                    showFailAlert()
                }
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: "\(message)가 완성되었습니다. 맛있게 드세요", preferredStyle: .alert)
        let okAtion = UIAlertAction(title: "OK", style: .default) {
            (action) in self.nowStocks()
        }
        alert.addAction(okAtion)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?" , preferredStyle: .alert)
        let noAtion = UIAlertAction(title: "아니오", style: .cancel)
        let yesAtion = UIAlertAction(title: "예", style: .default) { action in
            self.moveViewController(name: "EditStockViewController")
        }
        
        alert.addAction(yesAtion)
        alert.addAction(noAtion)
        
        present(alert, animated: true, completion: nil)
    }
    
    func moveViewController(name: String) {
        let sceneName = self.storyboard?.instantiateViewController(withIdentifier: name)
        
        sceneName?.modalTransitionStyle = .crossDissolve
        self.present(sceneName!, animated: true, completion: nil)
    }
}

