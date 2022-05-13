//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class HomeViewController: UIViewController {
    private var juiceMaker = JuiceMaker()
    
    @IBOutlet private var fruitStockLabel: [FruitStockLabel]!
    
    @IBOutlet private weak var strawberryAndBananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoAndKiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet private weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet private weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoJuiceOrderButton: UIButton!
    
    private var orderButton: [UIButton] {
        return [strawberryJuiceOrderButton,
                mangoAndKiwiJuiceOrderButton,
                strawberryAndBananaJuiceOrderButton,
                bananaJuiceOrderButton,
                pineappleJuiceOrderButton,
                kiwiJuiceOrderButton,
                mangoJuiceOrderButton]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fruitStockAddObserverDidChanged()
        updateLabel(to: juiceMaker.store.stock)
        configureOrderButtons()
    }
    
    func fruitStockAddObserverDidChanged() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitStockLabel), name: .notifyStock, object: nil)
    }
    
    private func configureOrderButtons() {
        orderButton.forEach { orderButton in
            orderButton.addTarget(
                self,
                action: #selector(orderButtonDidTap),
                for: .touchUpInside)
        }
    }
    
    @objc dynamic private func updateFruitStockLabel(notification: Notification) {
        guard let fruitsStock = notification.userInfo?["stock"] as? [Fruit: Int]
        else {
            return
        }
        updateLabel(to: fruitsStock)
    }
    
    private func updateLabel(to stock: [Fruit: Int]) {
        fruitStockLabel.forEach { $0.configure(with: stock) }
    }
    
    @objc private func orderButtonDidTap(_ sender: UIButton) {
        do {
            let juice = try convertToJuice(from: sender)
            try juiceMaker.make(menu: juice)
            showCompletionAlert(menu: juice)
        } catch JuiceMakerError.lackOfStock {
            showLackOfStockAlert()
        } catch {
            print(error)
        }
    }
    
    private func convertToJuice(from button: UIButton) throws -> Menu {
        switch button {
        case strawberryAndBananaJuiceOrderButton:
            return .strawberryAndBananaJuice
        case mangoAndKiwiJuiceOrderButton:
            return .mangoAndKiwiJuice
        case strawberryJuiceOrderButton:
            return .strawberryJuice
        case bananaJuiceOrderButton:
            return .bananaJuice
        case pineappleJuiceOrderButton:
            return .pineappleJuice
        case kiwiJuiceOrderButton:
            return .kiwiJuice
        case mangoJuiceOrderButton:
            return .mangoJuice
        default:
            throw JuiceMakerError.noneExistMenu
        }
    }
    
    private func showLackOfStockAlert() {
        let lackOfStockAlert = UIAlertController(
            title: "알림",
            message: "재료가 모자라요. 재고를 수정할까요?",
            preferredStyle: .alert
        )
        let noAlert = UIAlertAction(
            title: "아니오",
            style: .default,
            handler: nil
        )
        let okAlert = UIAlertAction(
            title: "예",
            style: .default) { _ in
            self.presentEditStockViewController()
        }
        
        lackOfStockAlert.addAction(noAlert)
        lackOfStockAlert.addAction(okAlert)
        
        present(lackOfStockAlert, animated: true)
    }
    
    private func showCompletionAlert(menu: Menu) {
        let completionAlert = UIAlertController(
            title: "알림",
            message: "\(menu) 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert
        )
        
        let okAlert = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        
        completionAlert.addAction(okAlert)
        
        present(completionAlert, animated: true)
    }
    
    private func presentEditStockViewController() {
        let editStockVCNavigationController = UIStoryboard(name: "EditStockNavigationController", bundle: nil)
        guard let editStockVC = editStockVCNavigationController.instantiateViewController(
            withIdentifier: "EditStockViewController"
        ) as? EditStockViewController
        else {
            return
        }
        editStockVC.delegate = self
        editStockVC.fruits.currentStock = juiceMaker.store.stock
        self.present(editStockVC, animated: true)
    }

    
    @IBAction func tapEditStock(_ sender: UIBarButtonItem) {
            self.presentEditStockViewController()
    }
}

extension HomeViewController: EditStockViewControllerDelegate {
    func editStockViewControllerDidChangeStock(
        _ editedStock: [Fruit: Int],
        _ editStockViewController: EditStockViewController
    ) {
        juiceMaker.store.replaceStock(with: editedStock)
    }
}
