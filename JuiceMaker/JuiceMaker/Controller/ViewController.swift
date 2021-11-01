//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet var stockOfStrawberryLabel: UILabel!
    @IBOutlet var stockOfBananaLabel: UILabel!
    @IBOutlet var stockOfPineappleLabel: UILabel!
    @IBOutlet var stockOfKiwiLabel: UILabel!
    @IBOutlet var stockOfMangoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStockLabel()
    }
    
    func changeStockLabel() {
        let currentStock = juiceMaker.checkFruitStock()
        for (fruit, stock) in currentStock {
            switch fruit {
            case .strawberry:
                stockOfStrawberryLabel.text = stock
            case .banana:
                stockOfBananaLabel.text = stock
            case .pineapple:
                stockOfPineappleLabel.text = stock
            case .kiwi:
                stockOfKiwiLabel.text = stock
            case .mango:
                stockOfMangoLabel.text = stock
            }
        }
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        let juice = switchMenuToUIButton(button: sender)
        let isSuccess: Bool = juiceMaker.make(juice)
        
        if isSuccess {
            showAlert(isSuccess: true, message: "\(juice) 나왔습니다! 맛있게 드세요!")
            changeStockLabel()
        } else {
            showAlert(isSuccess: false, message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func switchMenuToUIButton(button: UIButton) -> Menu {
        switch button.currentTitle {
        case "딸바쥬스 주문":
            return Menu.strawberryBananaJuice
        case "망키쥬스 주문":
            return Menu.mangoKiwiJuice
        case "딸기쥬스 주문":
            return Menu.strawberryJuice
        case "바나나쥬스 주문":
            return Menu.bananaJuice
        case "파인애플쥬스 주문":
            return Menu.pineappleJuice
        case "키위쥬스 주문":
            return Menu.kiwiJuice
        case "망고쥬스 주문":
            return Menu.mangoJuice
        default:
            fatalError("Non-Existent Button")
        }
    }
    
    func showAlert(isSuccess: Bool, message: String) {
        let alert: UIAlertController
        
        if isSuccess {
            alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.viewDidLoad()
            }
            alert.addAction(okAction)
        } else {
            alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
            let moveEditView = UIAlertAction(title: "재고수정하기", style: .default) {_ in
                self.moveEditView()
            }
            let closeAlert = UIAlertAction(title: "닫기", style: .default) {_ in
                self.viewDidLoad()
            }
            alert.addAction(moveEditView)
            alert.addAction(closeAlert)
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func hitEditButton(_ sender: UIBarButtonItem) {
        moveEditView()
    }
    
    func moveEditView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editViewController: EditFruitStockViewController = storyboard.instantiateViewController(identifier: "EditViewController")
        let navigationController = UINavigationController(rootViewController: editViewController)
        present(navigationController, animated: true, completion: nil)
    }
}
