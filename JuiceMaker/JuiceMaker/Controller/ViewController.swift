//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
    }
    
    func updateStockLabels() {
        do {
            strawberryStockLabel.text = try juiceMaker.returnStockString(of: .strawberry)
            bananaStockLabel.text = try juiceMaker.returnStockString(of: .banana)
            pineappleStockLabel.text = try juiceMaker.returnStockString(of: .pineapple)
            kiwiStockLabel.text = try juiceMaker.returnStockString(of: .kiwi)
            mangoStockLabel.text = try juiceMaker.returnStockString(of: .mango)
        } catch {
            print("에러")
        }
    }
    
    func showOutOfStockErrorAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler : { (action) in
            guard let changeStockVC = self.storyboard?.instantiateViewController(identifier: "changeStock") else { return }
            self.present(changeStockVC, animated: true, completion: nil)
        })
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler : nil)
        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showSuccessOrderAlert(title juice: Juice) {
        let alert = UIAlertController(title: "\(juice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler : nil )
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler : nil)
        alert.addAction(cancel)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.titleLabel?.text?.components(separatedBy: " ").first,
              let juice = Juice(rawValue: juiceName) else {
            return
        }
        do {
            try juiceMaker.orderJuice(name: juice)
            showSuccessOrderAlert(title: juice)
            updateStockLabels()
        } catch FruitStoreError.outOfStock {
            showOutOfStockErrorAlert()
        } catch {
            print(error.localizedDescription)
        }
    }
}

