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
        self.juiceMaker.setDelegate(by: self)
        configureLabel()
    }
    
    private func configureLabel() {
        self.strawberryStockLabel.text = juiceMaker.getStock(fruit: .strawberry).toString
        self.bananaStockLabel.text = juiceMaker.getStock(fruit: .banana).toString
        self.pineappleStockLabel.text = juiceMaker.getStock(fruit: .pineapple).toString
        self.kiwiStockLabel.text = juiceMaker.getStock(fruit: .kiwi).toString
        self.mangoStockLabel.text = juiceMaker.getStock(fruit: .mango).toString
    }
    
    @IBAction func onTouchStockButton(_ sender: UIBarButtonItem) {
        let stockViewController = StockViewController.instantiate()
        self.navigationController?.present(stockViewController, animated: true)
    }
    
    @IBAction func onTouchOrderButton(_ sender: UIButton) {
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
        guard let label = label else { fatalError("버튼을 찾을 수 없습니다.") }
        
        let inputString = label
        let targetWord = "주문"

        var words = inputString.components(separatedBy: " ")
        words.removeAll { $0 == targetWord }
        let outputString = words.joined(separator: " ")
        
        guard let juice = Juice(rawValue: outputString) else { fatalError("쥬스를 찾을 수 없습니다.")}
        return juice
    }
    
    private func showSuccessAlert(juice: Juice) {
        let alert = UIAlertController(
            title: "주문",
            message: "\(juice.name) 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "잘먹겠습니다❤️",
            style: .default,
            handler: nil
        ))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFailureAlert(error: FruitStoreError) {
        let alert = UIAlertController(
            title: error.errorTitle,
            message: error.errorDescription,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "아니오",
            style: .default,
            handler: nil
        ))
        
        alert.addAction(UIAlertAction(
            title: "예",
            style: .default,
            handler: { _ in
            let stockViewController = StockViewController.instantiate()
            self.navigationController?.present(stockViewController, animated: true)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension MainViewController: FruitStoreDelegate {
    func onChangeStock() {
        self.configureLabel()
    }
}
