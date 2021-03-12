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
    
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var strawberyBananaButton: UIButton!
    
    
    @IBAction func touchUpjuiceOrderButton(_ sender: Any) {
        let orderButton = sender as! UIButton
        let selectedFruit = Juices(rawValue: orderButton.tag)!
        do {
            try maker.make(order: selectedFruit)
        } catch {
            LakeStockAlert()
        }
        orderSuccessAlert(selectedFruit)
    
    }
    
    override func viewDidLoad() {
        decorateButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updataStock()
    }
}

extension JuiceMakerViewController {
    func LakeStockAlert() {
        let failAlert = UIAlertController(title: nil , message: "재료가 모자라요 재고를 수정할까요?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default)
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

    func orderSuccessAlert(_ kindJuice: Juices) {
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
    
    func decorateButton() {
        strawberryButton.layer.cornerRadius = 15
        strawberryButton.layer.borderWidth = 1.2
        bananaButton.layer.cornerRadius = 15
        bananaButton.layer.borderWidth = 1.2
        pineappleButton.layer.cornerRadius = 15
        pineappleButton.layer.borderWidth = 1.2
        kiwiButton.layer.cornerRadius = 15
        kiwiButton.layer.borderWidth = 1.2
        mangoButton.layer.cornerRadius = 15
        mangoButton.layer.borderWidth = 1.2
        mangoKiwiButton.layer.cornerRadius = 15
        mangoKiwiButton.layer.borderWidth = 1.2
        strawberyBananaButton.layer.cornerRadius = 15
        strawberyBananaButton.layer.borderWidth = 1.2
    }
}


