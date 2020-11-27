//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var fruitStock = FruitStock(initialFruitNumber: 10)

    @IBOutlet weak var strawberryImageView: UIImageView!
    @IBOutlet weak var bananaImageView: UIImageView!
    @IBOutlet weak var pineappleImageView: UIImageView!
    @IBOutlet weak var kiwiImageView: UIImageView!
    @IBOutlet weak var mangoImageView: UIImageView!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitStockLabel(fruit: .strawberry)
        updateFruitStockLabel(fruit: .banana)
        updateFruitStockLabel(fruit: .pineapple)
        updateFruitStockLabel(fruit: .kiwi)
        updateFruitStockLabel(fruit: .mango)
        
        strawberryImageView.image = UIImage(named: "딸기")
        bananaImageView.image = UIImage(named: "바나나")
        pineappleImageView.image = UIImage(named: "파인애플")
        kiwiImageView.image = UIImage(named: "키위")
        mangoImageView.image = UIImage(named: "망고")
    }

    @IBAction func orderStrawberryJuiceButton(_ sender: UIButton) {
        makeJuice(.strawberryJuice)
    }
    @IBAction func orderBananaJuiceButton(_ sender: UIButton) {
        makeJuice(.bananaJuice)
    }
    @IBAction func orderPineappleJuiceButton(_ sender: UIButton) {
        makeJuice(.pineappleJuice)
    }
    @IBAction func orderKiwiJuiceButton(_ sender: UIButton) {
        makeJuice(.kiwiJuice)
    }
    @IBAction func orderMangoJuiceButton(_ sender: UIButton) {
        makeJuice(.mangoJuice)
    }
    @IBAction func orderStrawberryAndBananaJuiceButton(_ sender: UIButton) {
        makeJuice(.strawberryAndBananaJuice)
    }
    @IBAction func orderMangoAndKiwiJuiceButton(_ sender: UIButton) {
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
            _ in
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
            strawberryStockLabel.text = "\(fruitStock.strawberry)"
        case .banana:
            bananaStockLabel.text = "\(fruitStock.banana)"
        case .pineapple:
            pineappleStockLabel.text = "\(fruitStock.pineapple)"
        case .kiwi:
            kiwiStockLabel.text = "\(fruitStock.kiwi)"
        case .mango:
            mangoStockLabel.text = "\(fruitStock.mango)"
        }
    }
    
    func updateFruitStockLabel(order: Juice) {
        switch order {
        case .strawberryJuice:
            strawberryStockLabel.text = "\(fruitStock.strawberry)"
        case .bananaJuice:
            bananaStockLabel.text = "\(fruitStock.banana)"
        case .pineappleJuice:
            pineappleStockLabel.text = "\(fruitStock.pineapple)"
        case .kiwiJuice:
            kiwiStockLabel.text = "\(fruitStock.kiwi)"
        case .mangoJuice:
            mangoStockLabel.text = "\(fruitStock.mango)"
        case .strawberryAndBananaJuice:
            strawberryStockLabel.text = "\(fruitStock.strawberry)"
            bananaStockLabel.text = "\(fruitStock.banana)"
        case .mangoAndKiwiJuice:
            mangoStockLabel.text = "\(fruitStock.mango)"
            kiwiStockLabel.text = "\(fruitStock.kiwi)"
        }
    }
}

// 재고 관리 화면으로 이동하기
extension ViewController {
    func moveToManageStockVC() {
        guard let manageStockView = self.storyboard?.instantiateViewController(identifier: "ManageStockVC") else { return }
        manageStockView.modalTransitionStyle = .coverVertical
        present(manageStockView, animated: true, completion: nil)
    }
}
