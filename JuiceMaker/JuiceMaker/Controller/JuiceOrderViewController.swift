//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary

import UIKit

class JuiceOrderViewController: UIViewController {
    let fruitStore = FruitStore.shared
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
    }
    
    func updateStockLabel() {
        strawberryStockLabel.text = "\(fruitStore.bringQuantity(of: .strawberry))"
        bananaStockLabel.text = "\(fruitStore.bringQuantity(of: .banana))"
        pineappleStockLabel.text = "\(fruitStore.bringQuantity(of: .pineapple))"
        kiwiStockLabel.text = "\(fruitStore.bringQuantity(of: .kiwi))"
        mangoStockLabel.text = "\(fruitStore.bringQuantity(of: .mango))"
    }
    
    @IBAction func hitJuiceOrderButton(_ sender: UIButton) {
        guard let choosedJuice = findJuice(by: sender.tag) else { return }
        placeAnOrder(for: choosedJuice)
    }
    
    func placeAnOrder(for juice: Juice) {
        guard let juice = juiceMaker.takeOrder(juice) else { return }
    }
    
    func findJuice(by tag: Int) -> Juice? {
        switch tag {
        case 1:
            return .strawberryJuice
        case 2:
            return .bananaJuice
        case 3:
            return .pineappleJuice
        case 4:
            return .kiwiJuice
        case 5:
            return .mangoJuice
        case 6:
            return .strawberryBananaJuice
        case 7:
            return .mangoKiwiJuice
        default:
            return nil
        }
    }
    
    func showSuccessMessage(juice: Juice) {
        let alert = UIAlertController(title: "\(juice) 쥬스가 나왔습니다. 맛있게 드세요", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showFailureMessage() {
        let failureMessage = "재료가 모자라요. 재고를 수정할까요?"
        let alert = UIAlertController(title: failureMessage, message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default)
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
}
