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
    
    @IBOutlet weak var ddalbaBtn: UIButton!
    @IBOutlet weak var mangkiBtn: UIButton!
    @IBOutlet weak var strawberryBtn: UIButton!
    @IBOutlet weak var bananaBtn: UIButton!
    @IBOutlet weak var pineappleBtn: UIButton!
    @IBOutlet weak var kiwiBtn: UIButton!
    @IBOutlet weak var mangoBtn: UIButton!
    
    func printFruitLabel() {
        let stock = juiceMaker.fruitStore
        strawberryStockLabel.text = String(stock[.strawberry]?.amount ?? 0)
        bananaStockLabel.text = String(stock[.banana]?.amount ?? 0)
        pineappleStockLabel.text = String(stock[.banana]?.amount ?? 0)
        kiwiStockLabel.text = String(stock[.banana]?.amount ?? 0)
        mangoStockLabel.text = String(stock[.banana]?.amount ?? 0)
    }
    
    func succeededMakingJuiceAlert(_ message: JuiceMaker.JuiceType) {
        
        let alert = UIAlertController(title: nil,
                                      message: "\(message.rawValue) 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,
                                     style: . default) { (action) in
            self.juiceMaker.makeJuice(order: message)
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func failedMakingJuiceAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        let noAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func orderFruitJuice(_ sender: UIButton) {
        switch sender {
        case ddalbaBtn:
            succeededMakingJuiceAlert(.ddalbaJuice)
        case mangkiBtn:
            succeededMakingJuiceAlert(.mangoKiwiJuice)
        case strawberryBtn:
            succeededMakingJuiceAlert(.strawberryJuice)
        case bananaBtn:
            succeededMakingJuiceAlert(.bananaJuice)
        case pineappleBtn:
            succeededMakingJuiceAlert(.pineappleJuice)
        case kiwiBtn:
            succeededMakingJuiceAlert(.kiwiJuice)
        case mangoBtn:
            succeededMakingJuiceAlert(.mangoJuice)
        default:
            return
        }
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        printFruitLabel()
    }
}
