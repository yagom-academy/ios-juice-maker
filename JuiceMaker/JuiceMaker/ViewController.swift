//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initializeStockValue = 10
        juiceMaker = JuiceMaker(stock: initializeStockValue)
        updateStockLabel()
    }
    
    func updateStockLabel() {
        strawberryStockLabel.text = String(juiceMaker.getStock(name: .strawberry)) + "개"
        bananaStockLabel.text = String(juiceMaker.getStock(name: .banana)) + "개"
        pineappleStockLabel.text = String(juiceMaker.getStock(name: .pineapple)) + "개"
        kiwiStockLabel.text = String(juiceMaker.getStock(name: .kiwi)) + "개"
        mangoStockLabel.text = String(juiceMaker.getStock(name: .mango)) + "개"
    }
    
    func orderJuice(menu: JuiceMaker.JuiceMenu) {
        if juiceMaker.makeJuice(memu: menu) == .success {
            orderSuccessAlert(menu: menu)
        } else {
            orderFailAlert()
        }
        updateStockLabel()
    }
    
    func orderSuccessAlert(menu: JuiceMaker.JuiceMenu) {
        let name = getOrderJuiceName(menu: menu)
        let alert = UIAlertController(title: "\(name) 나왔습니다.", message: "맛있게 드세요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
    
    func orderFailAlert() {
        let alert = UIAlertController(title: "재고가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        alert.addAction(UIAlertAction(title: "예", style: .default) { _ in
            self.performSegue(withIdentifier: "ToStockManager", sender: nil)
        })
        present(alert, animated: true)
    }
    
    func getOrderJuiceName(menu: JuiceMaker.JuiceMenu) -> String  {
        switch menu {
        case .strawberryAndBanana:
            return "딸바쥬스"
        case .mangoAndKiwi:
            return "망키쥬스"
        case .strawberry:
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .pineapple:
            return "파인애플쥬스"
        case .kiwi:
            return "키위쥬스"
        case .mango:
            return "망고쥬스"
        }
    }
    
    @IBAction func pressedStrawberryAndBananaJuiceButton(_ sender: UIButton) {
        orderJuice(menu: .strawberryAndBanana)
    }
    
    @IBAction func pressedMangoAndKiwiJuiceButton(_ sender: UIButton) {
        orderJuice(menu: .mangoAndKiwi)
    }
    
    @IBAction func pressedStrawberryJuiceButton(_ sender: UIButton) {
        orderJuice(menu: .strawberry)
    }
    
    @IBAction func pressedBananaJuiceButton(_ sender: UIButton) {
        orderJuice(menu: .banana)
    }
    
    @IBAction func pressedPineappleJuiceButton(_ sender: UIButton) {
        orderJuice(menu: .pineapple)
    }
    
    @IBAction func pressedKiwiJuiceButton(_ sender: UIButton) {
        orderJuice(menu: .kiwi)
    }
    
    @IBAction func pressedMangoJuiceButton(_ sender: UIButton) {
        orderJuice(menu: .mango)
    }
}
