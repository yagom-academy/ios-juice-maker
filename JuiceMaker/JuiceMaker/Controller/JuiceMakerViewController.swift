//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: Notification.Name("fruitInventory"), object: nil , queue: nil) { Notification in
        }
    }
    
    @IBAction func orderFruitJuice(_ sender: UIButton) {
        switch sender {
        case strawberryBananaJuiceButton:
            alertResult(juiceMaker.takeOrder(.strawberryAndBananaJuice))
        case mangoKiwiJuiceButton:
            alertResult(juiceMaker.takeOrder(.mangoAndKiwiJuice))
        case strawberryJuiceButton:
            alertResult(juiceMaker.takeOrder(.strawberryJuice))
        case bananaJuiceButton:
            alertResult(juiceMaker.takeOrder(.bananaJuice))
        case pineappleJuiceButton:
            alertResult(juiceMaker.takeOrder(.pineappleJuice))
        case kiwiJuiceButton:
            alertResult(juiceMaker.takeOrder(.kiwiJuice))
        case mangoJuiceButton:
            alertResult(juiceMaker.takeOrder(.mangoJuice))
        default:
            break
        }
    }
    
    func alertResult(_ alertInfomation: (fruitJuice: FruitJuice, result: Bool)) {
        if alertInfomation.result {
            let alert = UIAlertController(title: nil, message: "***쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .actionSheet)
            let yesAction = UIAlertAction(title: "예", style: .default) { UIAlertAction in
                self.presentModalView(withIdentifier: "FruitStoreViewController")
            }
            let noAction = UIAlertAction(title: "아니오", style: .default)
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true)
        }
    }
    
    func presentModalView(withIdentifier: String){
        guard let modalVC = storyboard?.instantiateViewController(withIdentifier: withIdentifier) else {
            return
        }
        present(modalVC, animated: true)
    }
}
