//
//  JuiceMaker - MakeJuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MakeJuiceViewController: UIViewController {
    
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var changeStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet var orderButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtonTitleLabel()
        modifyFruitStockOnLabel()

    }
    
    private func configureButtonTitleLabel() {
        for button in orderButton {
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.textAlignment = .center
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        modifyFruitStockOnLabel()
    }
    
    private func modifyFruitStockOnLabel() {
        
        
        let fruitAndLabel: [Fruit: UILabel] = [
            .strawberry: strawberryStockLabel,
            .banana: bananaStockLabel,
            .pineapple: pineappleStockLabel,
            .kiwi: kiwiStockLabel,
            .mango: mangoStockLabel
        ]
        
        for (fruit, label) in  fruitAndLabel {
            guard let stock = FruitStore.shared.currentFruitStock[fruit] else { return }
            label.text = String(stock)
        }
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let senderTitle = sender.titleLabel?.text else { return }
        let juiceNameFromSendTitle = senderTitle.components(separatedBy: "쥬스").first
        
        switch juiceNameFromSendTitle {
        case "딸기":
            showOrderedAlert(by:.strawberryJuice)
        case "딸바":
            showOrderedAlert(by:.strawberryBananaJuice)
        case "바나나":
            showOrderedAlert(by:.bananaJuice)
        case "파인애플":
            showOrderedAlert(by:.pineappleJuice)
        case "키위":
            showOrderedAlert(by:.kiwiJuice)
        case "망키":
            showOrderedAlert(by:.mangoKiwiJuice)
        case "망고":
            showOrderedAlert(by:.mangoJuice)
        default:
            print("없는 메뉴입니다.")
        }
        modifyFruitStockOnLabel()
    }
    
    private func showOrderedAlert(by juice: Juice) {
        if let _ = juiceMaker.make(juice) {
            showMakeJuiceAlert(juice)
        } else {
            showInsufficientStockAlert()
        }
    }
    
    private func showMakeJuiceAlert(_ juice: Juice) {
        let alert = UIAlertController(title: "\(juice.rawValue)쥬스 나왔습니다.", message: "맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showInsufficientStockAlert() {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정 할까요?", preferredStyle: UIAlertController.Style.alert)
        let result = UIAlertAction(title: "아니요", style: .cancel)
        let okAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.presentChangeStockViewController()
        })
        
        alert.addAction(result)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    private func presentChangeStockViewController() {
        guard let changeStockNavigationController = storyboard?.instantiateViewController(withIdentifier: "ChangeStockNavigationController") else { return }
        
        changeStockNavigationController.modalPresentationStyle = .fullScreen
        present(changeStockNavigationController, animated: true)
    }
    
    @IBAction func changeStockBarButton(_ sender: UIBarButtonItem) {
        presentChangeStockViewController()
    }
}
