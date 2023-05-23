//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by Yetti, yy-ss99, Mary

import UIKit

final class JuiceOrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet var stockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
    }
    
    private func updateStockLabel() {
        for (index, label) in stockLabels.enumerated() {
            label.text = "\(juiceMaker.fruitStore.bringQuantity(of: Fruits.allCases[index]))"
        }
    }
    
    private enum ButtonTitle {
        static let strawberryJuiceOrder = "딸기쥬스 주문"
        static let bananaJuiceOrder = "바나나쥬스 주문"
        static let pineappleJuiceOrder = "파인애플쥬스 주문"
        static let kiwiJuiceOrder = "키위쥬스 주문"
        static let mangoJuiceOrder = "망고쥬스 주문"
        static let strawberryBananaJuiceOrder = "딸바쥬스 주문"
        static let mangoKiwiJuiceOrder = "망키쥬스 주문"
    }
    
    private func searchJuice(by buttonTitle: String) -> Juice? {
        switch buttonTitle {
        case ButtonTitle.strawberryJuiceOrder:
            return .strawberryJuice
        case ButtonTitle.bananaJuiceOrder:
            return .bananaJuice
        case ButtonTitle.pineappleJuiceOrder:
            return .pineappleJuice
        case ButtonTitle.kiwiJuiceOrder:
            return .kiwiJuice
        case ButtonTitle.mangoJuiceOrder:
            return .mangoJuice
        case ButtonTitle.strawberryBananaJuiceOrder:
            return .strawberryBananaJuice
        case ButtonTitle.mangoKiwiJuiceOrder:
            return .mangoKiwiJuice
        default:
            return nil
        }
    }
    
    private func placeAnOrder(for juice: Juice) {
        if let juice = juiceMaker.takeOrder(juice) {
            presentSuccessAlertController(juice: juice)
            updateStockLabel()
        } else {
            presentFailureAlertController()
        }
    }
    
    private func presentSuccessAlertController(juice: Juice) {
        let successMessage = "\(juice)가 나왔습니다! 맛있게 드세요!"
        let alertController = UIAlertController(title: successMessage, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    private func presentFailureAlertController() {
        let failureMessage = "재료가 모자라요. 재고를 수정할까요?"
        let alertController = UIAlertController(title: failureMessage, message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.presentChangeStockViewController() })
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        present(alertController, animated: true)
    }
    
    private func presentChangeStockViewController() {
        guard let viewController = storyboard?
            .instantiateViewController(identifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
        viewController.delegate = self
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    @IBAction private func hitJuiceOrderButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle,
                let choosedJuice = searchJuice(by: buttonTitle) else { return }
        placeAnOrder(for: choosedJuice)
    }
    
    @IBAction private func hitChangeStockButton(_ sender: UIBarButtonItem) {
        presentChangeStockViewController()
    }
}

extension JuiceOrderViewController: StockDelegate {
    func getCurrentStock() -> [Int] {
        return Fruits.allCases.map { juiceMaker.fruitStore.bringQuantity(of: $0) }
    }
}
