//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryStockLable: UILabel!
    @IBOutlet weak var bananaStockLable: UILabel!
    @IBOutlet weak var pineappleStockLable: UILabel!
    @IBOutlet weak var kiwiStockLable: UILabel!
    @IBOutlet weak var mangoStockLable: UILabel!
    
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    func juiceIsReadyAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func notEnoughFruitAlert(message: String) {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTouchCurrentVC(_ sender: Any) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "StorageViewController")
        newVC?.modalTransitionStyle = .flipHorizontal
        self.present(newVC!, animated: true, completion: nil)
    }
    
    @IBAction func touchUpMakeStrawberryJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.strawberryJuice)
            guard let stockOfStrawberry = FruitStorage.shared.refrigerator[.strawberry] else {
                throw JuiceMakerError.invalidAccess
            }
            strawberryStockLable.text = String(stockOfStrawberry)
            juiceIsReadyAlert(message: "\(Juice.strawberryJuice.description) 나왔습니다. 맛있게 드세요")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeBananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.bananaJuice)
            guard let stockOfBanana = FruitStorage.shared.refrigerator[.banana] else {
                return
            }
            bananaStockLable.text = String(stockOfBanana)
            juiceIsReadyAlert(message: "\(Juice.bananaJuice.description) 나왔습니다. 맛있게 드세요!!")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakepineappleJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.pineappleJuice)
            guard let stockOfPineapple = FruitStorage.shared.refrigerator[.pineapple] else {
                return
            }
            pineappleStockLable.text = String(stockOfPineapple)
            juiceIsReadyAlert(message: "\(Juice.pineappleJuice.description) 나왔습니다. 맛있게 드세요")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeKiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.kiwiJuice)
            guard let stockOfKiwi = FruitStorage.shared.refrigerator[.kiwi] else {
                return
            }
            kiwiStockLable.text = String(stockOfKiwi)
            juiceIsReadyAlert(message: "\(Juice.kiwiJuice.description) 나왔습니다. 맛있게 드세요")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeMangoJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.mangoJuice)
            guard let stockOfMango = FruitStorage.shared.refrigerator[.mango] else {
                return
            }
            mangoStockLable.text = String(stockOfMango)
            juiceIsReadyAlert(message: "\(Juice.mangoJuice.description) 나왔습니다. 맛있게 드세요")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeStrawberryBananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.strawberryBananaJuice)
            guard let stockOfStrawberry = FruitStorage.shared.refrigerator[.strawberry],
                  let stockOfBanana = FruitStorage.shared.refrigerator[.banana] else {
                return
            }
            strawberryStockLable.text = String(stockOfStrawberry)
            bananaStockLable.text = String(stockOfBanana)
            juiceIsReadyAlert(message: "\(Juice.strawberryBananaJuice.description) 나왔습니다. 맛있게 드세요")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    @IBAction func touchUpMakeMangoKiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(order: Juice.mangoKiwiJuice)
            guard let stockOfMango = FruitStorage.shared.refrigerator[.mango],
                  let stockOfKiwi = FruitStorage.shared.refrigerator[.kiwi] else {
                return
            }
            mangoStockLable.text = String(stockOfMango)
            kiwiStockLable.text = String(stockOfKiwi)
            juiceIsReadyAlert(message: "\(Juice.mangoKiwiJuice.description) 나왔습니다. 맛있게 드세요")
        } catch {
            notEnoughFruitAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
}
