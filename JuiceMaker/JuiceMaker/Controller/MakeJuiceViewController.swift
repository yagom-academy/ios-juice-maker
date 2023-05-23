//
//  JuiceMaker - MakeJuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MakeJuiceViewController: UIViewController {
    
    var juiceMaker: JuiceMaker = JuiceMaker()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        modifyFruitStockOnLabel()
    }

    private func modifyFruitStockOnLabel() {
        
        let fruitAndLabels: [Fruit: UILabel] = [
            .strawBerry: strawBerryStockLabel,
            .banana: bananaStockLabel,
            .pineApple: pineappleStockLabel,
            .kiwi: kiwiStockLabel,
            .mango: mangoStockLabel
        ]
        
        for (fruit, label) in  fruitAndLabels {
            guard let stock = FruitStore.shared.currentFruitStock[fruit] else { return }
            label.text = String(stock)
        }
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let senderTitle = sender.titleLabel?.text else { return }
        let juiceNameFromSendTitle = senderTitle.components(separatedBy: "쥬스").first
        
        switch juiceNameFromSendTitle {
        case "딸기":
            showOrderedAlert(juiceNameFromSendTitle, by:.strawBerryJuice)
        case "딸바":
            showOrderedAlert(juiceNameFromSendTitle, by:.strawBerryBananaJuice)
        case "바나나":
            showOrderedAlert(juiceNameFromSendTitle, by:.bananaJuice)
        case "파인애플":
            showOrderedAlert(juiceNameFromSendTitle, by:.pineAppleJuice)
        case "키위":
            showOrderedAlert(juiceNameFromSendTitle, by:.kiwiJuice)
        case "망키":
            showOrderedAlert(juiceNameFromSendTitle, by:.mangoKiwiJuice)
        case "망고":
            showOrderedAlert(juiceNameFromSendTitle, by:.mangoJuice)
        default:
            print("없는 메뉴입니다.")
        }
        modifyFruitStockOnLabel()
    }
    
    private func showOrderedAlert(_ juiceName: String?, by juice: Juice) {
        if let _ = juiceMaker.make(juice) {
            guard let juiceName = juiceName else { return }
            let alert = UIAlertController(title: "\(juiceName)쥬스 나왔습니다.", message: "맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정 할까요?", preferredStyle: UIAlertController.Style.alert)
            let result = UIAlertAction(title: "아니요", style: .cancel)
            let okAction = UIAlertAction(title: "예", style: .default, handler: { _ in
                self.presentChangeStockViewController()
            })
            
            alert.addAction(result)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    private func presentChangeStockViewController() {
        guard let changeStockNavigationController = storyboard?.instantiateViewController(withIdentifier: "ChangeStockNavigationController") else { return }
        changeStockNavigationController.modalPresentationStyle = .fullScreen
        present(changeStockNavigationController, animated: true)
    }
    
    @IBAction func changeStockBarButton(_ sender: Any) {
        presentChangeStockViewController()
    }
}
