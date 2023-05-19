//
//  JuiceMaker - MakeJuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MakeJuiceViewController: UIViewController {
    
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    private var fruitStock: [Fruit: Int] = [:]
    
    @IBOutlet weak var strawBerryJuiceButton: UIButton!
    @IBOutlet weak var strawBerryBananaJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var changeStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawBerryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modifyFruitStockOnLabel()
    }
    
    private func modifyFruitStockOnLabel() {
        fruitStock = juiceMaker.fruitStore.updateFruitStock()
        
        let fruitAndLabels: [Fruit: UILabel] = [
            .strawBerry: strawBerryStockLabel,
            .banana: bananaStockLabel,
            .pineApple: pineappleStockLabel,
            .kiwi: kiwiStockLabel,
            .mango: mangoStockLabel
        ]
        
        for (fruit, label) in  fruitAndLabels {
            guard let stock = self.fruitStock[fruit] else { return }
            label.text = String(stock)
        }
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let senderTitle = sender.titleLabel?.text else { return }
        let juiceNameFromSendTitle = senderTitle.components(separatedBy: "쥬스").first
        
        switch juiceNameFromSendTitle {
        case "딸기":
            showOrderedAlert(sender, by:.strawBerryJuice)
        case "딸바":
            showOrderedAlert(sender, by:.strawBerryBananaJuice)
        case "바나나":
            showOrderedAlert(sender, by:.bananaJuice)
        case "파인애플":
            showOrderedAlert(sender, by:.pineAppleJuice)
        case "키위":
            showOrderedAlert(sender, by:.kiwiJuice)
        case "망키":
            showOrderedAlert(sender, by:.mangoKiwiJuice)
        case "망고":
            showOrderedAlert(sender, by:.mangoJuice)
        default:
            print("없는 메뉴입니다.")
        }
        modifyFruitStockOnLabel()
    }
    
    private func showOrderedAlert(_ sender: UIButton, by juice: Juice) {
        if juiceMaker.make(juice) {
            guard let buttonText = sender.titleLabel?.text,
                  let juiceName = buttonText.components(separatedBy: "쥬스").first else { return }
            let alert = showAlert(title: "\(juiceName)쥬스 나왔습니다.", message: "맛있게 드세요!")
            let okAction = UIAlertAction(title: "확인", style: .default, handler :nil)
            
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            let alert = showAlert(title: "재료가 모자라요.", message: "재고를 수정 할까요?")
            let result = UIAlertAction(title: "아니요", style: .cancel)
            let okAction = UIAlertAction(title: "예", style: .default, handler : { _ in
                self.presentChangeStockViewController()
            })
            
            alert.addAction(result)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    private func showAlert(title: String, message: String) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    }
    
    private func presentChangeStockViewController() {
        guard let changeStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
        let navigationController = UINavigationController(rootViewController: changeStockViewController)
        self.present(navigationController, animated: true)
    }
    
    @IBAction func changeStockBarButton(_ sender: Any) {
        presentChangeStockViewController()
    }
}
