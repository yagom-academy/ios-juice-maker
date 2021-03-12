//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

class JuiceMakerViewController: UIViewController {
    
    let maker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    
    @IBAction func juiceOrderButton(_ sender: Any) {
        let orderButton = sender as! UIButton
        let tag = orderButton.tag
        var kindJuice = orderButton.currentTitle!
        kindJuice = kindJuice.components(separatedBy: ["주","문"]).joined(separator: "")
        let selectedFruit = Juices(rawValue: tag)!
        do {
            try maker.make(order: selectedFruit)
        } catch {
            LakeStockAlert()
        }
        orderSuccessAlert(kindJuice)
    
    }
    
//    override func viewDidLoad() {
//        let initFruitStock = maker.currentFruitStock()
//        strawberryLabel.text = String(initFruitStock[.strawberry]!)
//        bananaLabel.text = String(initFruitStock[.banana]!)
//        pineappleLabel.text = String(initFruitStock[.pineapple]!)
//        mangoLabel.text = String(initFruitStock[.mango]!)
//        kiwiLabel.text = String(initFruitStock[.kiwi]!)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        updataStock()
    }

}

extension JuiceMakerViewController {
    func LakeStockAlert() {
        let failAlert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default, handler : nil )
        let stockSettingAction = UIAlertAction(title: "예", style: .cancel){ (action) in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerViewController") as? StockManagerViewController else {
                return
            }

            vc.modalPresentationStyle = .fullScreen
                
            self.present(vc,animated: true)
        }
        failAlert.addAction(stockSettingAction)
        failAlert.addAction(cancel)

        present(failAlert, animated: true, completion: nil)
    }

    func orderSuccessAlert(_ kindJuice: String) {
        let alert = UIAlertController(title: "주문 확인", message: "\(kindJuice) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { _ in
            self.updataStock()
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func updataStock() {
        let stock = maker.currentFruitStock()
        strawberryLabel.text = String(stock[.strawberry]!)
        bananaLabel.text = String(stock[.banana]!)
        pineappleLabel.text = String(stock[.pineapple]!)
        mangoLabel.text = String(stock[.mango]!)
        kiwiLabel.text = String(stock[.kiwi]!)
    }
}


