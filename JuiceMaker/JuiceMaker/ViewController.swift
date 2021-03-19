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
    
    private let juiceMaker: JuiceMaker = JuiceMaker()
    
    private func showJuiceIsReadyAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func warnNotEnoughFruitAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        let yesAction = UIAlertAction(title: "예", style: .default) { (action) in
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "StorageViewController")
            newVC?.modalTransitionStyle = .flipHorizontal
            self.present(newVC!, animated: true, completion: nil)
        }
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTouchCurrentViewController(_ sender: Any) {
        guard let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "StorageViewController") else {
            return
        }
        newViewController.modalTransitionStyle = .flipHorizontal
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func touchUpMakeStrawberryJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.strawberryJuice)
            guard let stockOfStrawberry = FruitStorage.shared.refrigerator[.strawberry] else {
                throw JuiceMakerError.invalidAccess
            }
            strawberryStockLabel.text = String(stockOfStrawberry)
            showJuiceIsReadyAlert(message: "\(Juice.strawberryJuice.rawValue) 나왔습니다. 맛있게 드세요")
        } catch {
            warnNotEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeBananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.bananaJuice)
            guard let stockOfBanana = FruitStorage.shared.refrigerator[.banana] else {
                return
            }
            bananaStockLabel.text = String(stockOfBanana)
            showJuiceIsReadyAlert(message: "\(Juice.bananaJuice.rawValue) 나왔습니다. 맛있게 드세요!!")
        } catch {
            warnNotEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakepineappleJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.pineappleJuice)
            guard let stockOfPineapple = FruitStorage.shared.refrigerator[.pineapple] else {
                return
            }
            pineappleStockLabel.text = String(stockOfPineapple)
            showJuiceIsReadyAlert(message: "\(Juice.pineappleJuice.rawValue) 나왔습니다. 맛있게 드세요")
        } catch {
            warnNotEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeKiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.kiwiJuice)
            guard let stockOfKiwi = FruitStorage.shared.refrigerator[.kiwi] else {
                return
            }
            kiwiStockLabel.text = String(stockOfKiwi)
            showJuiceIsReadyAlert(message: "\(Juice.kiwiJuice.rawValue) 나왔습니다. 맛있게 드세요")
        } catch {
            warnNotEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeMangoJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.mangoJuice)
            guard let stockOfMango = FruitStorage.shared.refrigerator[.mango] else {
                return
            }
            mangoStockLabel.text = String(stockOfMango)
            showJuiceIsReadyAlert(message: "\(Juice.mangoJuice.rawValue) 나왔습니다. 맛있게 드세요")
        } catch {
            warnNotEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeStrawberryBananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.strawberryBananaJuice)
            guard let stockOfStrawberry = FruitStorage.shared.refrigerator[.strawberry],
                  let stockOfBanana = FruitStorage.shared.refrigerator[.banana] else {
                return
            }
            strawberryStockLabel.text = String(stockOfStrawberry)
            bananaStockLabel.text = String(stockOfBanana)
            showJuiceIsReadyAlert(message: "\(Juice.strawberryBananaJuice.rawValue) 나왔습니다. 맛있게 드세요")
        } catch {
            warnNotEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeMangoKiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.mangoKiwiJuice)
            guard let stockOfMango = FruitStorage.shared.refrigerator[.mango],
                  let stockOfKiwi = FruitStorage.shared.refrigerator[.kiwi] else {
                return
            }
            mangoStockLabel.text = String(stockOfMango)
            kiwiStockLabel.text = String(stockOfKiwi)
            showJuiceIsReadyAlert(message: "\(Juice.mangoKiwiJuice.rawValue) 나왔습니다. 맛있게 드세요")
        } catch {
            warnNotEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
}
