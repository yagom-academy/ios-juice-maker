//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet var stockOfStrawberry: UILabel!
    @IBOutlet var stockOfBanana: UILabel!
    @IBOutlet var stockOfPineapple: UILabel!
    @IBOutlet var stockOfKiwi: UILabel!
    @IBOutlet var stockOfMango: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStockLabel()
    }
    
    func showAlert(isSuccess: Bool, message: String) {
        if isSuccess {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.viewDidLoad()
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
            let moveEditView = UIAlertAction(title: "재고수정하기", style: .default) {_ in
                self.moveEditView()
            }
            let closeAlert = UIAlertAction(title: "닫기", style: .cancel) {_ in
                self.viewDidLoad()
            }
            alert.addAction(moveEditView)
            alert.addAction(closeAlert)
            present(alert, animated: true, completion: nil)
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
    
    func changeStockLabel() {
        let currentStock = juiceMaker.checkFruitStock()
        for (fruit, stock) in currentStock {
            switch fruit {
            case .strawberry:
                stockOfStrawberry.text = stock
            case .banana:
                stockOfBanana.text = stock
            case .pineapple:
                stockOfPineapple.text = stock
            case .kiwi:
                stockOfKiwi.text = stock
            case .mango:
                stockOfMango.text = stock
            }
        }
    }
    
    @IBAction func hitEditButton(_ sender: UIBarButtonItem) {
        moveEditView()
    }
    
    func moveEditView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editViewController: EditViewController = storyboard.instantiateViewController(identifier: "EditViewController")
        let navigationController = UINavigationController(rootViewController: editViewController)
        present(navigationController, animated: true, completion: nil)
    }
}
