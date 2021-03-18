//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

let juiceMaker = JuiceMaker()

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockVC: UILabel!
    @IBOutlet weak var bananaStockVC: UILabel!
    @IBOutlet weak var pineappleStockVC: UILabel!
    @IBOutlet weak var kiwiStockVC: UILabel!
    @IBOutlet weak var mangoStockVC: UILabel!
    
    
    
    func showAlert(juice: FruitJuice) {
        switch juiceMaker.manufactureJuice(of: juice) {
        case true:
            let alertRight = UIAlertController(title: nil, message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let rightAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertRight.addAction(rightAction)
            self.present(alertRight, animated: true)
            
        case false:
            let alertWrong = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "예", style: .default, handler: { (action) in
                                            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextVC") else { return }
                                            self.present(nextVC, animated: true)})
            let noAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            alertWrong.addAction(yesAction)
            alertWrong.addAction(noAction)
            self.present(alertWrong, animated: true)
        }
    }
    
    func showPresentStock() {
        strawberryStockVC.text = String(juiceMaker.fruitStock.strawberry)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPresentStock()
    }


    @IBAction func strawberryBananaJuiceOrder(_ sender: Any) {
        juiceMaker.manufactureJuice(of: FruitJuice.strawberryBananaJuice)
        showAlert(juice: .strawberryBananaJuice)
        print(juiceMaker.fruitStock.strawberry)
        print(juiceMaker.fruitStock.banana)
    }
    @IBAction func mangoKiwiJuiceOrder(_ sender: Any) {
    }
    @IBAction func strawberryJuiceOrder(_ sender: Any) {
    }
    @IBAction func bananaJuiceOrder(_ sender: Any) {
    }
    @IBAction func pineappleJuiceOrder(_ sender: Any) {
    }
    @IBAction func kiwiJuiceOrder(_ sender: Any) {
    }
    @IBAction func mangoJuiceOrder(_ sender: Any) {
    }
    
    
    
}

