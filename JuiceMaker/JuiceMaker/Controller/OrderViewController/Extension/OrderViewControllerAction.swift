//
//  OrderViewControllerAction.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

extension OrderViewController {
    
    // MARK: - Button Action
    
    @IBAction func touchStrawberryBananaJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .strawberryBananaJuice)
    }
    
    @IBAction func touchMangoKiwiJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .mangoKiwiJuice)
    }
    
    @IBAction func touchStrawberryJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .strawberryJuice)
    }
    
    @IBAction func touchBananaJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .bananaJuice)
    }
    
    @IBAction func touchPinappleJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .pineappleJuice)
    }
    
    @IBAction func touchKiwiJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .kiwiJuice)
    }
    
    @IBAction func touchMangoJuiceOrderButton(_ sender: Any) {
        orderJuice(menu: .mangoJuice)
    }
    
    // MARK: - Helper Method of Ordering Juice Process
    
    private func orderJuice(menu: Juice) {
        juiceMaker.makeJuice(of: menu, result: { result in
            switch result {
            case .success:
                let orderResultAlertController: UIAlertController = Alert.makeAlert(of: .success, title: "\(menu.name) 나왔습니다! 맛있게 드세요!")
                self.present(orderResultAlertController, animated: true, completion: nil)
            case .fail(let error):
                let errorMessage: String? = parseErrorMessage(of: error)
                
                let orderResultAlertController: UIAlertController = Alert.makeAlert(of: .error, title: "재료가 모자라요. 재고를 수정할까요?", message: errorMessage) { action in
                    self.presentManageStockViewController()
                }
                
                self.present(orderResultAlertController, animated: true, completion: nil)
            }
        })
    }
    
    func parseErrorMessage(of error: Error) -> String? {
        var errorMessage: String?
        
        if let fruitStoreError: FruitStoreError = error as? FruitStoreError {
            errorMessage = fruitStoreError.errorDescription
        }
        else if let juiceMakerError: JuiceMakerError = error as? JuiceMakerError {
            errorMessage = juiceMakerError.errorDescription
        }
        
        return errorMessage
    }
    
    // MARK: - Fruit Stock Label Related
    
    @objc func didChangeStock() {
        let stocks = self.juiceMaker.fruitStore.store
        
        stocks.forEach { fruit, currentCount in
            let label = self.getCountLabel(of: fruit)
            DispatchQueue.main.async {
                label.text = "\(currentCount)"
            }
        }
    }
    
    private func getCountLabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return self.strawberryCountLabel
        case .banana:
            return self.bananaCountLabel
        case .pineapple:
            return self.pineappleCountLabel
        case .kiwi:
            return self.kiwiCountLabel
        case .mango:
            return self.mangoCountLabel
        }
    }
    
    // MARK: - Presenting ManageStockViewController
    
    @objc func presentManageStockViewController() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

        if let manageStockNavigationController: UINavigationController = mainStoryboard.instantiateViewController(withIdentifier: "ManageStockNavigation") as? UINavigationController {
            manageStockNavigationController.modalPresentationStyle = .fullScreen
            present(manageStockNavigationController, animated: true, completion: nil)
        }
    }
    
}
