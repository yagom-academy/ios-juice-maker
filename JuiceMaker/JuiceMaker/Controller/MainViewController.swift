//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.configureLabel()
    }
    
    private func configureLabel() {
        self.strawberryStockLabel.text = juiceMaker.getStock(fruit: .strawberry).toString
        self.bananaStockLabel.text = juiceMaker.getStock(fruit: .banana).toString
        self.pineappleStockLabel.text = juiceMaker.getStock(fruit: .pineapple).toString
        self.kiwiStockLabel.text = juiceMaker.getStock(fruit: .kiwi).toString
        self.mangoStockLabel.text = juiceMaker.getStock(fruit: .mango).toString
    }
    
    @IBAction private func tapStockEditButton(_ sender: UIBarButtonItem) {
        self.presentStockViewController()
    }
    
    @IBAction private func tapOrderButton(_ sender: UIButton) {
        do {
            let juice = try self.convertButtonLabelToJuice(buttonTitle: sender.titleLabel?.text)
            try self.juiceMaker.makeJuice(juice: juice)
            showSuccessAlert(juice: juice)
        } catch  {
            guard let error = error as? ErrorExplainable else { return }
            self.showFailureAlert(error: error)
        }
    }
    
    private func convertButtonLabelToJuice(buttonTitle: String?) throws -> Juice {
        guard let buttonTitle = buttonTitle else { throw StoryboardError.notFoundComponent }
        
        let targetWord = "주문"
        let processedWord = buttonTitle
            .replacingOccurrences(of: targetWord, with: "")
            .trimmingCharacters(in: .whitespaces)
        
        guard let juice = Juice(rawValue: processedWord) else { throw JuiceMakerError.notFoundJuice }
        
        return juice
    }
    
    private func showSuccessAlert(juice: Juice) {
        let alert = UIAlertController(
            title: Alert.title,
            message: "\(juice.name) " + Alert.orderSuccessMessage,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: Alert.orderSuccessConfirm,
            style: .default,
            handler: { _ in
                self.configureLabel()
            }
        ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFailureAlert(error: ErrorExplainable) {
        let alert = UIAlertController(
            title: error.title,
            message: error.description,
            preferredStyle: .alert
        )
        
        if error is FruitStoreError {
            alert.addAction(UIAlertAction(
                title: Alert.no,
                style: .default,
                handler: nil
            ))
            
            alert.addAction(UIAlertAction(
                title: Alert.yes,
                style: .default,
                handler: { _ in
                    self.presentStockViewController()
                }))
        } else {
            alert.addAction(UIAlertAction(
                title: Alert.confirm,
                style: .default,
                handler: nil
            ))
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    private func presentStockViewController() {
        guard let stockViewController = self
            .storyboard?
            .instantiateViewController(
                identifier: String(describing: StockViewController.self),
                creator: { coder in
                    StockViewController(currentFruitStock: self.juiceMaker.getAllStock(), coder: coder)
                }
            ) else { return }
        
        stockViewController.delegate = self
        stockViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(stockViewController, animated: true)
    }
}

extension MainViewController: StockViewControllerDelegate {
    func changeStock(into changedStock: [Fruit: Int]) {
        self.juiceMaker.updateStock(to: changedStock)
    }
}

extension MainViewController {
    private enum Alert {
        static let yes = "예"
        static let no = "아니오"
        static let confirm = "확인"
        static let title = "주문"
        static let orderSuccessMessage = "나왔습니다! 맛있게 드세요!"
        static let orderSuccessConfirm = "잘먹겠습니다❤️"
    }
}
