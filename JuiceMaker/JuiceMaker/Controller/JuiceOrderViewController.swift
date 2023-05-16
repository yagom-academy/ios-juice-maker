//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    @IBOutlet var fruitLabel: [UILabel]!
    
    private let fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
    private lazy var yagombucks = JuiceMaker(fruitStore: fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yagombucks.delegate = self
        loadFruitStock()
    }
    
    private func loadFruitStock() {
        for (index, fruit) in fruitLabel.enumerated() {
            guard let pick = Fruit(rawValue: index) else { return }

            fruit.text = String(fruitStore.provideFruitStock(pick))
        }
    }
    
    private func moveToFruitStockViewController() {
        let pushJuiceOrderViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController")
        
        self.navigationController?.pushViewController(pushJuiceOrderViewController!, animated: true)
    }
}

// MARK: - Button Action
extension JuiceOrderViewController {
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let juice = JuiceMaker.Menu(rawValue: sender.tag) else { return }
        
        yagombucks.makeJuice(menu: juice)
    }
    
    @IBAction func changeStockButtonTapped(_ sender: Any) {
        moveToFruitStockViewController()
    }
}

// MARK: - JuiceMake Delegate
extension JuiceOrderViewController: JuiceMakeDelegate {
    func successJuiceMake(_ menu: JuiceMaker.Menu) {
        let successAlert = UIAlertController(title: "주문 성공!", message: "\(menu.koreanName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default)
        
        successAlert.addAction(okButton)
        present(successAlert, animated: false)
    }
    
    func failJuiceMake() {
        let failAlert = UIAlertController(title: "재고가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let noButton = UIAlertAction(title: "아니오", style: .default)
        let yesButton = UIAlertAction(title: "예", style: .default, handler: yesButtonTapped)
        
        failAlert.addAction(noButton)
        failAlert.addAction(yesButton)
        present(failAlert, animated: false)
    }
    
    func changeFruitStock(fruit: Fruit, amount: String) {
        let fruitIndex = fruit.rawValue
        
        fruitLabel[fruitIndex].text = amount
    }
}

// MARK: - Alert Handler
extension JuiceOrderViewController {
    private func yesButtonTapped(action: UIAlertAction) {
        moveToFruitStockViewController()
    }
}
