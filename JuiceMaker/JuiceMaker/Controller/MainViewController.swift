//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var juiceOrderButtons: [UIButton]!
    @IBOutlet weak var stockManagerButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentStock()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showCurrentStock()
    }

    func showCurrentStock() {
        juiceMaker.fruitStore.inventory.keys.forEach {
            switch $0 {
            case .strawberry:
                stockLabels[0].text = String(juiceMaker.fruitStore.inventory[.strawberry] ?? 0)
            case .banana:
                stockLabels[1].text = String(juiceMaker.fruitStore.inventory[.banana] ?? 0)
            case .pineapple:
                stockLabels[2].text = String(juiceMaker.fruitStore.inventory[.pineapple] ?? 0)
            case .kiwi:
                stockLabels[3].text = String(juiceMaker.fruitStore.inventory[.kiwi] ?? 0)
            default:
                stockLabels[4].text = String(juiceMaker.fruitStore.inventory[.mango] ?? 0)
            }
        }
    }
    
    func order(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(by: juice.recipe)
            alertOrderCompletion(juice)
        } catch OrderError.outOfStock {
            alertOutOfStock()
        } catch {
            print(error)
        }
    }
    
    func alertOrderCompletion(_ juice: Juice) {
        let alert = UIAlertController(title: "주문완료", message: "\(juice.hangeulName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    
    func alertOutOfStock() {
        let alert = UIAlertController(title: "재고부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "예", style: .default) { action in
            self.performSegue(withIdentifier: "StockViewController", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func stockManagerButtonClicked(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "StockViewController", sender: self)
    }
    
    @IBAction func juiceOrderButtonCollection(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            order(.strawberryBananaJuice)
            showCurrentStock()
        case 2:
            order(.mangoKiwiJuice)
            showCurrentStock()
        case 3:
            order(.strawberryJuice)
            showCurrentStock()
        case 4:
            order(.bananaJuice)
            showCurrentStock()
        case 5:
            order(.pineappleJuice)
            showCurrentStock()
        case 6:
            order(.kiwiJuice)
            showCurrentStock()
        default:
            order(.mangoJuice)
            showCurrentStock()
        }
    }
}

