//
//  JuiceMaker - ViewController.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var showStockStrawberry: UILabel!
    @IBOutlet weak var showStockBanana: UILabel!
    @IBOutlet weak var showStockPineapple: UILabel!
    @IBOutlet weak var showStockKiwi: UILabel!
    @IBOutlet weak var showStockMango: UILabel!
    
    @IBAction func strawberryBananaJuiceButton(_ sender: Any) {
        order(juice: .strawberryBananaJuice)
    }
    @IBAction func strawberryJuiceButton(_ sender: Any) {
        order(juice: .strawberryJuice)
    }
    @IBAction func bananaJuiceButton(_ sender: Any) {
        order(juice: .bananaJuice)
    }
    @IBAction func mangoKiwiJuiceButton(_ sender: Any) {
        order(juice: .mangoKiwiJuice)
    }
    @IBAction func pineappleJuiceButton(_ sender: Any) {
        order(juice: .pineappleJuice)
    }
    @IBAction func kiwiJuiceButton(_ sender: Any) {
        order(juice: .kiwiJuice)
    }
    @IBAction func mangoJuiceButton(_ sender: Any) {
        order(juice: .mangoJuice)
    }
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showCurrentStock()
    }
 
    func showCurrentStock() {
        guard let strawberry = stock.fruitStockList[.strawberry],
              let banana = stock.fruitStockList[.banana],
              let pineapple = stock.fruitStockList[.pineapple],
              let kiwi = stock.fruitStockList[.kiwi],
              let mango = stock.fruitStockList[.mango] else {
            return
        }
        showStockStrawberry.text = String(strawberry)
        showStockBanana.text = String(banana)
        showStockPineapple.text = String(pineapple)
        showStockKiwi.text = String(kiwi)
        showStockMango.text = String(mango)
    }

    func orderSuccessAlert(juiceName: String) {
        let alert = UIAlertController(title: "재고 있음", message: "\(juiceName)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let OK = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(OK)
        present(alert, animated: true, completion: nil)
    }

    func orderFailureAlert() {
        let alert = UIAlertController(title: "재고 없음", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let OK = UIAlertAction(title: "확인", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "changeStock", sender: nil)
        })
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(OK)
        present(alert, animated: true, completion: nil)
    }
    
    func order(juice: JuiceMaker.Juice) {
        if juiceMaker.orderJuice(for: juice) {
            orderSuccessAlert(juiceName: juice.name)
            showCurrentStock()
        } else {
            orderFailureAlert()
        }
    }
}
