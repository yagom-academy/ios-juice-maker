//
//  JuiceMaker - ViewController.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    private let fruitStore = FruitStore.shared
    private let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
        notificationCenter.addObserver(self,
                                       selector: #selector(didReceiveSuccessOrder),
                                       name: .successUseFruit,
                                       object: nil)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(didReceiveFailureOrder),
                                       name: .failureUseFruit,
                                       object: nil)
    }
    
    private func updateStockLabel() {
        let fruits = fruitStore.fruits.mapValues{ String($0) }
        
        strawberryLabel.text = fruits[Fruit.strawberry]
        bananaLabel.text = fruits[Fruit.banana]
        pineappleLabel.text = fruits[Fruit.pineapple]
        kiwiLabel.text = fruits[Fruit.kiwi]
        mangoLabel.text = fruits[Fruit.mango]
    }
    
    @IBAction func editStockTapped(_ sender: UIBarButtonItem) {
        changeStockView()
    }
    
    func changeStockView() {
        guard let editStockView = self.storyboard?.instantiateViewController(withIdentifier:
                                                                                "EditStockViewController") else { return }
        self.navigationController?.pushViewController(editStockView, animated: true)
    }
    
    @IBAction func makeJuiceTapped(_ sender: UIButton) {
        let juiceMaker = JuiceMaker()
        
        guard let senderID = sender.restorationIdentifier else { return }
        switch senderID {
        case "OrderStrawberryBanana":
            juiceMaker.makeJuice(.strawberryBananaJuice)
        case "OrderStrawberry":
            juiceMaker.makeJuice(.strawberryJuice)
        case "OrderBanana":
            juiceMaker.makeJuice(.bananaJuice)
        case "OrderPineapple":
            juiceMaker.makeJuice(.pineappleJuice)
        case "OrderKiwi":
            juiceMaker.makeJuice(.kiwiJuice)
        case "OrderMango":
            juiceMaker.makeJuice(.mangoJuice)
        case "OrderMangoKiwi":
            juiceMaker.makeJuice(.mangoKiwiJuice)
        default:
            return
        }
    }
    
    func successAlert(_ juiceName: String) {
        let alert = UIAlertController(title: nil,
                                      message: "\(juiceName) 나왔습니다. 맛있게 드세요",
                                      preferredStyle: .alert)
        let check = UIAlertAction(title: "확인", style: .default)
        alert.addAction(check)
        present(alert, animated: true)
        
    }
    
    @objc private func didReceiveSuccessOrder(_ notification: Notification) {
        guard let juiceName = notification.userInfo?["juiceName"] as? String else { return }
        successAlert(juiceName)
        updateStockLabel()
    }
    
    func failureAlert(at fruitName: String, count: Int) {
        let alert = UIAlertController(title: nil,
                                      message: "\(fruitName)이/가 \(count)개 부족합니다. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let check = UIAlertAction(title: "예", style: .default) { _ in
            self.changeStockView()
        }
        let cancel = UIAlertAction(title: "아니요", style: .destructive)
        alert.addAction(check)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @objc private func didReceiveFailureOrder(_ notification: Notification) {
        guard let fruitName = notification.userInfo?["fruitName"] as? String,
              let count = notification.userInfo?["count"] as? Int else { return }
        
        failureAlert(at: fruitName, count: count)
        updateStockLabel()
    }
}

