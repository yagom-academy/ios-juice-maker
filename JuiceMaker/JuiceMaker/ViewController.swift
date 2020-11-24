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
        
        fruitStockLabel1.text = "\(fruitStock.strawberry)"
        fruitStockLabel2.text = "\(fruitStock.banana)"
        fruitStockLabel3.text = "\(fruitStock.pineapple)"
        fruitStockLabel4.text = "\(fruitStock.kiwi)"
        fruitStockLabel5.text = "\(fruitStock.mango)"
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
}

// alert 띄우기
extension ViewController {
    func showPosibleAlert(order: Juice) {
        let alert = UIAlertController(title: nil, message: "\(order.rawValue) 나왔습니다! 맛있게 드세요 :)", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)

        alert.addAction(OKAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showImposibleAlert(order: Juice) {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "예", style: .default, handler: nil)
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
            showPosibleAlert(order: order)
            fruitStock.useFruit(order: order)
        case false:
            showImposibleAlert(order: order)
        }
    }
}
