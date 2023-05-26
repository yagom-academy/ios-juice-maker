//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private let recipe: [JuiceMaker.Menu: JuiceMaker.Recipe] = [.strawberryJuice         : [(.strawberry, 16)],
                                                                .bananaJuice             : [(.banana, 2)],
                                                                .pineappleJuice          : [(.pineapple, 2)],
                                                                .kiwiJuice               : [(.kiwi, 3)],
                                                                .mangoJuice              : [(.mango, 3)],
                                                                .strawberryAndBananaJuice: [(.strawberry, 10), (.banana, 1)],
                                                                .mangoAndKiwiJuice       : [(.mango, 2), (.kiwi, 1)]]
    private let fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
    private lazy var juiceMaker = JuiceMaker(fruitStore, recipe)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpFruitLabelsText()
    }
    
    private func provideStockLabelText(fruit: Fruit) -> String {
        guard let stock = fruitStore.provideFruitStock(fruit) else {
            return "x"
        }
        
        return String(stock)
    }
    
    private func setUpFruitLabelsText() {
        strawberryLabel.text = provideStockLabelText(fruit: .strawberry)
        bananaLabel.text = provideStockLabelText(fruit: .banana)
        pineappleLabel.text = provideStockLabelText(fruit: .pineapple)
        kiwiLabel.text = provideStockLabelText(fruit: .kiwi)
        mangoLabel.text = provideStockLabelText(fruit: .mango)
    }
    
    private func presentFruitStockViewController() {
        guard let fruitStockViewController = storyboard?.instantiateViewController(identifier: "FruitStockViewController", creator: { coder in
            FruitStockViewController(coder: coder, fruitStore: self.fruitStore)
        }) else { return }
        
        fruitStockViewController.modalPresentationStyle = .fullScreen
        present(fruitStockViewController, animated: true)
    }
}

// MARK: - Button Action
extension JuiceOrderViewController {
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juice = juiceMaker.makeJuice(menuNumber: sender.tag) else {
            failJuiceMaking()
            return
        }
        
        successJuiceMaking(juice)
        setUpFruitLabelsText()
    }
    
    @IBAction func tappedChangeStockButton(_ sender: Any) {
        presentFruitStockViewController()
    }
}

// MARK: - Alert Handler
extension JuiceOrderViewController {
    private func successJuiceMaking(_ menu: JuiceMaker.Menu) {
        let successAlert = UIAlertController(title: "주문 성공!", message: "\(menu.koreanName) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okButtonAction = UIAlertAction(title: "확인", style: .default)
        
        successAlert.addAction(okButtonAction)
        present(successAlert, animated: false)
    }
    
    private func failJuiceMaking() {
        let failAlert = UIAlertController(title: "주문 실패!", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let noButtonAction = UIAlertAction(title: "아니오", style: .default)
        let yesButtonAction = UIAlertAction(title: "예", style: .default, handler: tappedYesButton)
        
        failAlert.addAction(noButtonAction)
        failAlert.addAction(yesButtonAction)
        present(failAlert, animated: false)
    }
    
    private func tappedYesButton(action: UIAlertAction) {
        presentFruitStockViewController()
    }
}
