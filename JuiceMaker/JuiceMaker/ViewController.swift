//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

var juiceMaker = JuiceMaker()

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel : UILabel!
    @IBOutlet weak var pineappleStockLabel : UILabel!
    @IBOutlet weak var kiwiStockLabel : UILabel!
    @IBOutlet weak var mangoStockLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingStockLabel()
    }
    
    private func settingStockLabel() {
        strawberryStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Strawberry.self)))
        bananaStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Banana.self)))
        pineappleStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Pineapple.self)))
        kiwiStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Kiwi.self)))
        mangoStockLabel.text = String(juiceMaker.fruitStocks.check(fruit: ObjectIdentifier(Mango.self)))
    }
    
    @IBAction private func tapMatchButton(sender: AnyObject) {
        guard let button = sender as? UIButton else{
            return
        }
        
        switch button.tag {
        case 1:
            alertAccordingToOrder(juiceRecipe: ObjectIdentifier(StrawberryJuice.self), juiceName: "딸기쥬스")
        case 2:
            alertAccordingToOrder(juiceRecipe: ObjectIdentifier(BananaJuice.self), juiceName: "바나나쥬스")
        case 3:
            alertAccordingToOrder(juiceRecipe: ObjectIdentifier(PineappleJuice.self), juiceName: "파인애플쥬스")
        case 4:
            alertAccordingToOrder(juiceRecipe: ObjectIdentifier(KiwiJuice.self), juiceName: "키위쥬스")
        case 5:
            alertAccordingToOrder(juiceRecipe: ObjectIdentifier(MangoJuice.self), juiceName: "망고쥬스")
        case 6:
            alertAccordingToOrder(juiceRecipe: ObjectIdentifier(StrawberryBananaJuice.self), juiceName: "딸바쥬스")
        case 7:
            alertAccordingToOrder(juiceRecipe: ObjectIdentifier(MangoKiwiJuice.self), juiceName: "망고키위쥬스")
        default:
            return
        }
    }
    
    private func alertAccordingToOrder(juiceRecipe: ObjectIdentifier, juiceName: String) {
        let orderState: OrderRestultMessage = juiceMaker.order(juice: juiceRecipe)

        switch orderState {
        case .completeMakeJuice:
            showSuccessAlert(message: juiceName)
        default:
            showFailAlert()
        }
    }
    
    private func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: "\(message)가 완성되었습니다. 맛있게 드세요", preferredStyle: .alert)
        let okAtion = UIAlertAction(title: "OK", style: .default) {
            (action) in self.settingStockLabel()
        }
        alert.addAction(okAtion)
        present(alert, animated: true, completion: nil)
    }
    
    private func showFailAlert() {
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
        let viewControllerName = self.storyboard?.instantiateViewController(withIdentifier: name)
        
        viewControllerName?.modalTransitionStyle = .crossDissolve
        self.present(viewControllerName!, animated: true, completion: nil)
    }
}

