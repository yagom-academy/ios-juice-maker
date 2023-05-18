//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary

import UIKit

final class JuiceOrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = "\(juiceMaker.fruitStore.bringQuantity(of: .strawberry))"
        bananaStockLabel.text = "\(juiceMaker.fruitStore.bringQuantity(of: .banana))"
        pineappleStockLabel.text = "\(juiceMaker.fruitStore.bringQuantity(of: .pineapple))"
        kiwiStockLabel.text = "\(juiceMaker.fruitStore.bringQuantity(of: .kiwi))"
        mangoStockLabel.text = "\(juiceMaker.fruitStore.bringQuantity(of: .mango))"
    }

    private func searchJuice(by buttonTitle: String) -> Juice? {
        switch buttonTitle {
        case "딸기쥬스 주문":
            return .strawberryJuice
        case "바나나쥬스 주문":
            return .bananaJuice
        case "파인애플쥬스 주문":
            return .pineappleJuice
        case "키위쥬스 주문":
            return .kiwiJuice
        case "망고쥬스 주문":
            return .mangoJuice
        case "딸바쥬스 주문":
            return .strawberryBananaJuice
        case "망키쥬스 주문":
            return .mangoKiwiJuice
        default:
            return nil
        }
    }
    
    private func placeAnOrder(for juice: Juice) {
        if let juice = juiceMaker.takeOrder(juice) {
            presentSuccessAlert(juice: juice)
            updateStockLabel()
        } else {
            presentFailureAlert()
        }
    }
    
    private func presentSuccessAlert(juice: Juice) {
        let successMessage = "\(juice)가 나왔습니다! 맛있게 드세요!"
        let alert = UIAlertController(title: successMessage, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    private func presentFailureAlert() {
        let failureMessage = "재료가 모자라요. 재고를 수정할까요?"
        let alert = UIAlertController(title: failureMessage, message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.pushChangeStockViewController() })
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
    
    private func pushChangeStockViewController() {
        guard let view = storyboard?
            .instantiateViewController(identifier: "ChangeStockViewController") else { return }
        navigationController?.pushViewController(view, animated: true)
    }
    
    @IBAction private func hitJuiceOrderButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle,
                let choosedJuice = searchJuice(by: buttonTitle) else { return }
        placeAnOrder(for: choosedJuice)
    }
    
    @IBAction private func hitChangeStockButton(_ sender: UIBarButtonItem) {
        pushChangeStockViewController()
    }
}
