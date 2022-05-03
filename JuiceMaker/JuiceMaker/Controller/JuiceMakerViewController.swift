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
    
    @IBOutlet weak var strawberryAndBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoAndKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: Notification.Name("fruitsStock"), object: nil , queue: nil) { Notification in
            guard let currentStock = Notification.userInfo as? [Fruit:Int]? else {
                return
            }
            self.updateFruitsStockLabels(currentStock)
        }
        updateFruitsStockLabels(juiceMaker.requestCurrentStock())
    }
    
    @IBAction func orderFruitJuice(_ sender: UIButton) {
        switch sender {
        case strawberryAndBananaJuiceButton:
            alertResult(juiceMaker.takeOrder(.strawberryAndBananaJuice))
        case mangoAndKiwiJuiceButton:
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
            let alert = UIAlertController(title: nil, message: "\(alertInfomation.fruitJuice.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .actionSheet)
            let yesAction = UIAlertAction(title: "예", style: .default) { UIAlertAction in
                self.presentModalViewController(withId: "FruitStoreViewController")
            }
            let noAction = UIAlertAction(title: "아니오", style: .default)
            alert.addAction(yesAction)
            alert.addAction(noAction)
            present(alert, animated: true)
        }
    }
    
    func presentModalViewController(withId: String) {
        guard let modalViewController = storyboard?.instantiateViewController(withIdentifier: withId) else {
            return
        }
        present(modalViewController, animated: true)
    }
    
    func updateFruitsStockLabels(_ stock: [Fruit:Int]?) {
        guard let unwrappedStock = stock else {
            return
        }
        for (fruit, value) in unwrappedStock {
            modifyFruitStockLabel(fruit.rawValue, value)
        }
    }
    
    func modifyFruitStockLabel(_ fruit: String, _ stock: Int?) {
        let allStockLabels: [UILabel] = [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
        guard let stock = stock else {
            return
        }
        for uiLabel in allStockLabels where uiLabel.accessibilityIdentifier == fruit {
            uiLabel.text = String(stock)
        }
    }
}
