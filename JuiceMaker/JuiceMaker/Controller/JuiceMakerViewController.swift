//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var orderButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let modifyStockViewController = segue.destination as? ModifyStockViewController else {
            return
        }
        modifyStockViewController.setStock(stocks: juiceMaker.fruitStore.fruitInventory)
    }
    
    @IBAction func unwindToJuiceMakerViewController(_ segue: UIStoryboardSegue) {
        guard let modifyStockViewController = segue.source as? ModifyStockViewController else {
            return
        }
        let modifiedStocks: [Int] = modifyStockViewController.getStock()
        updateFruitInventory(stocks: modifiedStocks)
        updateFruitStockLabel()
    }
        
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        guard let buttonIndex = orderButtons.firstIndex(of: sender) else {
            return
        }
        order(juice: Juice.allCases[buttonIndex])
        updateFruitStockLabel()
    }
    
    private func order(juice: Juice) {
        do {
            try juiceMaker.blendFruitJuice(menu: juice)
            showAlert(message: "\(juice)나왔습니다. 맛있게 드세요!",
                      actions: UIAlertAction(title: "닫기", style: .cancel))
        } catch JuiceMakerError.outOfFruitStock {
            showAlert(message: "\(JuiceMakerError.outOfFruitStock) 재고를 수정할까요?",
                      actions: UIAlertAction(title: "예", style: .default) {
                                action in self.presentModifyStockView() },
                               UIAlertAction(title: "아니오", style: .default))
        } catch {
            print(JuiceMakerError.unknownError)
        }
    }
    
    private func updateFruitInventory(stocks: [Int]) {
        for (inventoryIndex, stock) in stocks.enumerated() {
            juiceMaker.fruitStore.addStock(fruit: Fruit.allCases[inventoryIndex], amount: stock)
        }
    }
    
    private func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[fruitStockLabel.tag])
        }
    }
    
    private func showAlert(message: String, actions: UIAlertAction...) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
    private func presentModifyStockView() {
        self.performSegue(withIdentifier: "modifyStockViewSegue", sender: nil)
    }
}
