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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
    }
    
    private func configureLabel() {
        self.strawberryStockLabel.text = juiceMaker.getStock(fruit: .strawberry).toString
        self.bananaStockLabel.text = juiceMaker.getStock(fruit: .banana).toString
        self.pineappleStockLabel.text = juiceMaker.getStock(fruit: .pineapple).toString
        self.kiwiStockLabel.text = juiceMaker.getStock(fruit: .kiwi).toString
        self.mangoStockLabel.text = juiceMaker.getStock(fruit: .mango).toString
    }
    
    @IBAction func tapStockButton(_ sender: UIBarButtonItem) {
        let stockViewController = StockViewController.instantiate()
        self.navigationController?.present(stockViewController, animated: true)
    }
    
    @IBAction func tapOrderButton(_ sender: UIButton) {
        do {
            let juice = self.convertButtonLabelToJuice(label: sender.titleLabel?.text)
            try self.juiceMaker.makeJuice(juice: juice)
            showSuccessAlert(juice: juice)
        } catch {
            guard let error = error as? FruitStoreError else { return }
            self.showFailureAlert(error: error)
        }
    }
    
    private func convertButtonLabelToJuice(label: String?) -> Juice {
        guard let label = label else { return .unknown }
        
        let inputString = label
        let targetWord = Namespace.order
        
        let outputString = inputString
            .replacingOccurrences(of: targetWord, with: "")
            .trimmingCharacters(in: .whitespaces)
        
        guard let juice = Juice(rawValue: outputString) else { return .unknown }
        
        return juice
    }
    
    private func showSuccessAlert(juice: Juice) {
        let alert = UIAlertController(
            title: Namespace.order,
            message: "\(juice.name) " + Namespace.orderMessage,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: Namespace.thankYou,
            style: .default,
            handler: { _ in
                self.configureLabel()
            }
        ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFailureAlert(error: FruitStoreError) {
        let alert = UIAlertController(
            title: error.title,
            message: error.description,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: Namespace.no,
            style: .default,
            handler: nil
        ))
        
        alert.addAction(UIAlertAction(
            title: Namespace.yes,
            style: .default,
            handler: { _ in
                let stockViewController = StockViewController.instantiate()
                self.navigationController?.present(stockViewController, animated: true)
            }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension MainViewController {
    enum Namespace {
        static let yes = "예"
        static let no = "아니오"
        static let order = "주문"
        static let orderMessage = "나왔습니다! 맛있게 드세요!"
        static let thankYou = "잘먹겠습니다❤️"
    }
}
