//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    @IBOutlet var fruitLabels: [UILabel]!
    
    private let recipe: [JuiceMaker.Menu: [(Fruit, Int)]] = ([.strawberryJuice         : [(.strawberry, 16)],
                                                              .bananaJuice             : [(.banana, 2)],
                                                              .pineappleJuice          : [(.pineapple, 2)],
                                                              .kiwiJuice               : [(.kiwi, 3)],
                                                              .mangoJuice              : [(.mango, 3)],
                                                              .strawberryAndBananaJuice: [(.strawberry, 10), (.banana, 1)],
                                                              .mangoAndKiwiJuice       : [(.mango, 2), (.kiwi, 1)]])
    
    private let fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
    private lazy var yagombucks = JuiceMaker(fruitStore, recipe)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yagombucks.delegate = self
        loadFruitStock()
    }
    
    private func loadFruitStock() {
        for (index, fruit) in fruitLabels.enumerated() {
            guard let pick = Fruit(rawValue: index) else { return }

            fruit.text = String(fruitStore.provideFruitStock(pick))
        }
    }
    
    private func moveToFruitStockViewController() {
        guard let pushFruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else { return }
 
        self.navigationController?.pushViewController(pushFruitStockViewController, animated: true)
    }
}

// MARK: - Button Action
extension JuiceOrderViewController {
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juice = JuiceMaker.Menu(rawValue: sender.tag) else { return }
        
        yagombucks.makeJuice(menu: juice)
    }
    
    @IBAction func tappedChangeStockButton(_ sender: Any) {
        moveToFruitStockViewController()
    }
}

// MARK: - JuiceMake Delegate
extension JuiceOrderViewController: JuiceMakerDelegate {
    func successJuiceMake(_ menu: JuiceMaker.Menu) {
        let successAlert = UIAlertController(title: "주문 성공!", message: "\(menu.koreanName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default)
        
        successAlert.addAction(okButton)
        present(successAlert, animated: false)
    }
    
    func failJuiceMake() {
        let failAlert = UIAlertController(title: "주문 실패!", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let noButton = UIAlertAction(title: "아니오", style: .default)
        let yesButton = UIAlertAction(title: "예", style: .default, handler: tappedYesButton)
        
        failAlert.addAction(noButton)
        failAlert.addAction(yesButton)
        present(failAlert, animated: false)
    }
    
    func changeFruitStock(fruit: Fruit, amount: String) {
        let fruitIndex = fruit.rawValue
        
        guard fruitIndex < fruitLabels.count else { return }
        
        fruitLabels[fruitIndex].text = amount
    }
}

// MARK: - Alert Handler
extension JuiceOrderViewController {
    private func tappedYesButton(action: UIAlertAction) {
        moveToFruitStockViewController()
    }
}
