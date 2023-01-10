//
//  JuiceMaker - ViewController.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class OrderJuiceViewController: UIViewController {
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateStockLabel()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = juiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = juiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = juiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction private func orderJuiceButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            completeOrder(of: .strawberryBananaJuice)
        case 2:
            completeOrder(of: .mangoKiwiJuice)
        case 3:
            completeOrder(of: .strawberryJuice)
        case 4:
            completeOrder(of: .bananaJuice)
        case 5:
            completeOrder(of: .pineappleJuice)
        case 6:
            completeOrder(of: .kiwiJuice)
        case 7:
            completeOrder(of: .mangoJuice)
        default:
            print("선택오류")
        }
    }
    
    
    private func completeOrder(of orderedJuice: JuiceMenu) {
        do {
            try juiceMaker.makeJuice(orderedJuice)
            updateStockLabel()
            successAlert(name: orderedJuice.name)
        } catch JuiceMakerError.outOfStock {
            print(JuiceMakerError.outOfStock.message)
            failAlert()
        } catch JuiceMakerError.fruitError {
            print(JuiceMakerError.fruitError.message)
        } catch {
            print("알 수 없는 오류가 발생했습니다.")
        }
    }
    
    @IBAction private func manageStockBarButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toManageVC", sender: self)
    }
    
    private func successAlert(name: String) {
        let alert = UIAlertController(title: "\(name) 나왔습니다! 맛있게 드세요!",message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    private func failAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: { action in
            self.performSegue(withIdentifier: "toManageVC", sender: nil)
        })
        let cancel = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}


