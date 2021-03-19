//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryStockVC: UILabel!
    @IBOutlet weak var bananaStockVC: UILabel!
    @IBOutlet weak var pineappleStockVC: UILabel!
    @IBOutlet weak var kiwiStockVC: UILabel!
    @IBOutlet weak var mangoStockVC: UILabel!
    
    func showAlert(juice: FruitJuice) {
        switch JuiceMaker().canMakeJuice(of: juice) {
        case true:
            let alertRight = UIAlertController(title: nil, message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let rightAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertRight.addAction(rightAction)
            self.present(alertRight, animated: true)
        case false:
            let alertWrong = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "예", style: .default, handler: {(action) in
                                            guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextVC") else { return }
                                            self.present(nextVC, animated: true)})
            let noAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            alertWrong.addAction(yesAction)
            alertWrong.addAction(noAction)
            self.present(alertWrong, animated: true)
        }
    }
    
    func showPresentStock() {
        strawberryStockVC.text = String(FruitStock.shared.strawberry)
        bananaStockVC.text = String(FruitStock.shared.banana)
        pineappleStockVC.text = String(FruitStock.shared.pineapple)
        kiwiStockVC.text = String(FruitStock.shared.kiwi)
        mangoStockVC.text = String(FruitStock.shared.mango)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPresentStock()
    }

    @IBAction func strawberryBananaJuiceOrder(_ sender: Any) {
        showAlert(juice: .strawberryBananaJuice)
        JuiceMaker().serveJuice(of: FruitJuice.strawberryBananaJuice)
        showPresentStock()
    }
    
    @IBAction func mangoKiwiJuiceOrder(_ sender: Any) {
        showAlert(juice: .mangoKiwiJuice)
        JuiceMaker().serveJuice(of: FruitJuice.mangoKiwiJuice)
        showPresentStock()
    }
    
    @IBAction func strawberryJuiceOrder(_ sender: Any) {
        showAlert(juice: .strawberryJuice)
        JuiceMaker().serveJuice(of: FruitJuice.strawberryJuice)
        showPresentStock()
    }
    
    @IBAction func bananaJuiceOrder(_ sender: Any) {
        showAlert(juice: .bananaJuice)
        JuiceMaker().serveJuice(of: FruitJuice.bananaJuice)
        showPresentStock()
    }
    
    @IBAction func pineappleJuiceOrder(_ sender: Any) {
        showAlert(juice: .pineappleJuice)
        JuiceMaker().serveJuice(of: FruitJuice.pineappleJuice)
        showPresentStock()
    }
    
    @IBAction func kiwiJuiceOrder(_ sender: Any) {
        showAlert(juice: .kiwiJuice)
        JuiceMaker().serveJuice(of: FruitJuice.kiwiJuice)
        showPresentStock()
    }
    
    @IBAction func mangoJuiceOrder(_ sender: Any) {
        showAlert(juice: .mangoJuice)
        JuiceMaker().serveJuice(of: FruitJuice.mangoJuice)
        showPresentStock()
    }
}

