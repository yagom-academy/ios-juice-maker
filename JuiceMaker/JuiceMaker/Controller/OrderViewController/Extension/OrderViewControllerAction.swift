//
//  OrderViewControllerAction.swift
//  JuiceMaker
//
//  Created by HyeJee Kim on 2022/02/16.
//

import UIKit

extension OrderViewController {
    
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

}

extension OrderViewController {
    
    private func orderJuice(menu: Juice) {
        juiceMaker.makeJuice(of: menu, result: { result in
            switch result {
            case .success:
                let orderResultAlertController: UIAlertController = Alert.makeAlert(of: .success, title: "\(menu.name) 나왔습니다! 맛있게 드세요!")
                self.present(orderResultAlertController, animated: true, completion: nil)
            case .fail(let error):
                var errorMessage: String?
                if let fruitStoreError: FruitStoreError = error as? FruitStoreError {
                    errorMessage = fruitStoreError.errorDescription
                }
                else if let juiceMakerError: JuiceMakerError = error as? JuiceMakerError {
                    errorMessage = juiceMakerError.errorDescription
                }
                
                let orderResultAlertController: UIAlertController = Alert.makeAlert(of: .error, title: "재료가 모자라요. 재고를 수정할까요?", message: errorMessage) { action in
                    self.presentManageStockViewController()
                }
                self.present(orderResultAlertController, animated: true, completion: nil)
            }
        })
    }
    
}

extension OrderViewController {
    
    @objc func presentManageStockViewController() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let manageStockViewController: ManageStockViewController = mainStoryboard.instantiateViewController(withIdentifier: "ManageStockViewController") as? ManageStockViewController else {
            return
        }
        
        manageStockViewController.modalPresentationStyle = .fullScreen
        
        present(manageStockViewController, animated: true, completion: nil)
    }
    
}

struct Alert {
    
    enum AlertType {
        case success
        case error
    }
    
    static func makeAlert(of type: AlertType, title: String? = nil, message: String? = nil, actionHandler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        switch type {
        case .success:
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
        case .error:
            let yesAction: UIAlertAction = UIAlertAction(title: "예", style: .default, handler: actionHandler)
            alertController.addAction(yesAction)
            let noAction: UIAlertAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
            alertController.addAction(noAction)
        }
        
        return alertController
    }
    
}
