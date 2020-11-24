//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var fruitStock = FruitStock(initialFruitNumber: 10)

    @IBOutlet weak var fruitImageView1: UIImageView!
    @IBOutlet weak var fruitImageView2: UIImageView!
    @IBOutlet weak var fruitImageView3: UIImageView!
    @IBOutlet weak var fruitImageView4: UIImageView!
    @IBOutlet weak var fruitImageView5: UIImageView!
    
    @IBOutlet weak var fruitStockLabel1: UILabel!
    @IBOutlet weak var fruitStockLabel2: UILabel!
    @IBOutlet weak var fruitStockLabel3: UILabel!
    @IBOutlet weak var fruitStockLabel4: UILabel!
    @IBOutlet weak var fruitStockLabel5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitStockLabel(fruit: .strawberry)
        updateFruitStockLabel(fruit: .banana)
        updateFruitStockLabel(fruit: .pineapple)
        updateFruitStockLabel(fruit: .kiwi)
        updateFruitStockLabel(fruit: .mango)
    }

    @IBAction func juiceOrderButton1(_ sender: UIButton) {
        makeJuice(.strawberryJuice)
    }
    @IBAction func juiceOrderButton2(_ sender: UIButton) {
        makeJuice(.bananaJuice)
    }
    @IBAction func juiceOrderButton3(_ sender: UIButton) {
        makeJuice(.pineappleJuice)
    }
    @IBAction func juiceOrderButton4(_ sender: UIButton) {
        makeJuice(.kiwiJuice)
    }
    @IBAction func juiceOrderButton5(_ sender: UIButton) {
        makeJuice(.mangoJuice)
    }
    @IBAction func juiceOrderButton6(_ sender: UIButton) {
        makeJuice(.strawberryAndBananaJuice)
    }
    @IBAction func juiceOrderButton7(_ sender: UIButton) {
        makeJuice(.mangoAndKiwiJuice)
    }
    @IBAction func manageStockButton(_ sender: UIButton) {
        moveToManageStockVC()
    }
}

// alert 띄우기
extension ViewController {
    func showSuccessAlert(order: Juice) {
        let alert = UIAlertController(title: nil, message: "\(order.rawValue) 나왔습니다! 맛있게 드세요 :)", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(OKAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailAlert(order: Juice) {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "예", style: .default) {
            (UIAlertAction) in
            self.moveToManageStockVC()
        }
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        
        alert.addAction(OKAction)
        alert.addAction(cancleAction)
        present(alert, animated: true, completion: nil)
    }
}

// 쥬스 만들기
extension ViewController {
    func makeJuice(_ order: Juice) {
        switch fruitStock.isFruitEnough(order: order) {
        case true:
            showSuccessAlert(order: order)
            fruitStock.useFruit(order: order)
            updateFruitStockLabel(order: order)
        case false:
            showFailAlert(order: order)
        }
    }
}

// 과일재고 업데이트하기
extension ViewController {
    func updateFruitStockLabel(fruit: Fruit) {
        switch fruit {
        case .strawberry:
            fruitStockLabel1.text = "\(fruitStock.strawberry)"
        case .banana:
            fruitStockLabel2.text = "\(fruitStock.banana)"
        case .pineapple:
            fruitStockLabel3.text = "\(fruitStock.pineapple)"
        case .kiwi:
            fruitStockLabel4.text = "\(fruitStock.kiwi)"
        case .mango:
            fruitStockLabel5.text = "\(fruitStock.mango)"
        }
    }
    
    func updateFruitStockLabel(order: Juice) {
        switch order {
        case .strawberryJuice:
            fruitStockLabel1.text = "\(fruitStock.strawberry)"
        case .bananaJuice:
            fruitStockLabel2.text = "\(fruitStock.banana)"
        case .pineappleJuice:
            fruitStockLabel3.text = "\(fruitStock.pineapple)"
        case .kiwiJuice:
            fruitStockLabel4.text = "\(fruitStock.kiwi)"
        case .mangoJuice:
            fruitStockLabel5.text = "\(fruitStock.mango)"
        case .strawberryAndBananaJuice:
            fruitStockLabel1.text = "\(fruitStock.strawberry)"
            fruitStockLabel2.text = "\(fruitStock.banana)"
        case .mangoAndKiwiJuice:
            fruitStockLabel5.text = "\(fruitStock.mango)"
            fruitStockLabel4.text = "\(fruitStock.kiwi)"
        }
    }
}

// 재고 관리 화면으로 이동하기
extension ViewController {
    func moveToManageStockVC() {
        let manageStockView = self.storyboard!.instantiateViewController(identifier: "ManageStockVC")
        manageStockView.modalTransitionStyle = .coverVertical
        present(manageStockView, animated: true, completion: nil)
    }
}
