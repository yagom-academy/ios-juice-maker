//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    
    func orderJuice(_ juice: JuiceMaker.Juice) -> UIAlertController {
        let order = juiceMaker.makeJuice(juice)
        
        switch order {
        case .success(let juice):
            let alert = UIAlertController(title: "제조 성공!", message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okButton)
            return alert
        case .failure(let error):
            let alert = UIAlertController(title: "재고 없음!", message: error.localizedDescription, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "예", style: .default) { _ in
                guard let button = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") else {
                    return
                }
                self.navigationController?.pushViewController(button, animated: true)
            }
            let cancelButton = UIAlertAction(title: "아니오", style: .cancel)
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            return alert
        }
    }
    @IBAction func reviseStockButton(_ sender: UIBarButtonItem) {
        guard let button = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") else {
            return
        }
        self.navigationController?.pushViewController(button, animated: true)
    }
    
    @IBOutlet weak var strawberryStockValue: UILabel!
    @IBOutlet weak var bananaStockValue: UILabel!
    @IBOutlet weak var pineappleStockValue: UILabel!
    @IBOutlet weak var kiwiStockValue: UILabel!
    @IBOutlet weak var mangoStockValue: UILabel!
    
    @IBAction func strawberryBananaJuiceOrderButton(_ sender: UIButton) {
        self.present(orderJuice(.strawberryBananaJuice), animated: true)
    }
    @IBAction func mangokiwiJuiceOrderButton(_ sender: UIButton) {
        
    }
    @IBAction func strawberryJuiceOrderButton(_ sender: UIButton) {
        
    }
    @IBAction func bananaJuiceOrderButton(_ sender: UIButton) {
        
    }
    @IBAction func pineappleJuiceOrderButton(_ sender: UIButton) {
        
    }
    @IBAction func kiwiJuiceOrderButton(_ sender: UIButton) {
        
    }
    @IBAction func mangoJuiceOrderButton(_ sender: UIButton) {
        
    }

    lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
        .strawberry: strawberryStockValue,
        .banana: bananaStockValue,
        .pineapple: pineappleStockValue,
        .kiwi: kiwiStockValue,
        .mango: mangoStockValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (fruit, value) in fruitStockValue {
            value.text = String(juiceMaker.fruitStore.checkStockValue(fruit: fruit))
        }
    }
}

