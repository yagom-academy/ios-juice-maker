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
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setFruitStockLabel()
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        if juiceMaker.make(juice: .strawberryJuice) {
            present(alertJuiceReady(menu: .strawberryJuice), animated: true)
        } else {
            present(alertShortageStock(), animated: true)
        }
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        if juiceMaker.make(juice: .bananaJuice) {
            present(alertJuiceReady(menu: .bananaJuice), animated: true)
        } else {
            present(alertShortageStock(), animated: true)
        }
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        if juiceMaker.make(juice: .pineappleJuice) {
            present(alertJuiceReady(menu: .pineappleJuice), animated: true)
        } else {
            present(alertShortageStock(), animated: true)
        }
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        if juiceMaker.make(juice: .kiwiJuice) {
            present(alertJuiceReady(menu: .kiwiJuice), animated: true)
        } else {
            present(alertShortageStock(), animated: true)
        }
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        if juiceMaker.make(juice: .mangoJuice) {
            present(alertJuiceReady(menu: .mangoJuice), animated: true)
        } else {
            present(alertShortageStock(), animated: true)
        }
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        if juiceMaker.make(juice: .strawberryBananaJuice) {
            present(alertJuiceReady(menu: .strawberryBananaJuice), animated: true)
        } else {
            present(alertShortageStock(), animated: true)
        }
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        if juiceMaker.make(juice: .mangoKiwiJuice) {
            present(alertJuiceReady(menu: .mangoKiwiJuice), animated: true)
        } else {
            present(alertShortageStock(), animated: true)
        }
    }
    
    func setFruitStockLabel() {
        do {
            strawberryStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .strawberry))
            bananaStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .banana))
            pineappleStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .pineapple))
            kiwiStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .kiwi))
            mangoStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .mango))
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            default:
                print("알 수 없는 에러")
            }
        }
    }
    
    func alertJuiceReady(menu: JuiceMenu) -> UIAlertController {
        let juiceAlert = UIAlertController(title: "제조 완료", message: "\(menu) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        juiceAlert.addAction(UIAlertAction(title: "Yes!", style: .default, handler: { _ in print("yes 클릭") }))

        return juiceAlert
    }
    
    func alertShortageStock() -> UIAlertController {
        let juiceAlert = UIAlertController(title: "Juice", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        juiceAlert.addAction(UIAlertAction(title: "예", style: .destructive, handler: { _ in print("yes 클릭") }))
        juiceAlert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: { _ in print("no 클릭") }))
        
        return juiceAlert
    }
}
