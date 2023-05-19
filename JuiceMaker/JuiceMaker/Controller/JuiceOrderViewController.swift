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
    
    private let fruitStore: FruitStore// = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
    private var yagomJuiceStore: JuiceMaker// = JuiceMaker(fruitStore, recipe)
    
//    init() {
//        fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
//        yagomJuiceStore = JuiceMaker(fruitStore, recipe)
//    }

    required init?(coder: NSCoder) {
        fruitStore = FruitStore(fruitStocks: [.strawberry: 20, .banana: 20, .kiwi: 20, .mango: 20, .pineapple: 20])
        yagomJuiceStore = JuiceMaker(fruitStore, recipe)
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yagomJuiceStore.delegate = self
        setUpFruitLabelsText()
    }
    
    private func setUpFruitLabelsText() {
        strawberryLabel.text = String(fruitStore.provideFruitStock(.strawberry))
        bananaLabel.text = String(fruitStore.provideFruitStock(.banana))
        pineappleLabel.text = String(fruitStore.provideFruitStock(.pineapple))
        kiwiLabel.text = String(fruitStore.provideFruitStock(.kiwi))
        mangoLabel.text = String(fruitStore.provideFruitStock(.mango))
    }
    
    private func navigateToFruitStockViewController() {
        guard let fruitStockViewController = storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else { return }
        
        navigationController?.pushViewController(fruitStockViewController, animated: true)
    }
}

// MARK: - Button Action
extension JuiceOrderViewController {
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juice = JuiceMaker.Menu(rawValue: sender.tag) else { return }
        
        yagomJuiceStore.makeJuice(menu: juice)
    }
    
    @IBAction func tappedChangeStockButton(_ sender: Any) {
        navigateToFruitStockViewController()
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
    
    func changeFruitStock(fruit: Fruit, amount: Int) {
        let stockLabelText = String(amount)
        
        switch fruit {
        case .strawberry:
            strawberryLabel.text = stockLabelText
        case .banana:
            bananaLabel.text = stockLabelText
        case .pineapple:
            pineappleLabel.text = stockLabelText
        case .kiwi:
            kiwiLabel.text = stockLabelText
        case .mango:
            mangoLabel.text = stockLabelText
        }
    }
}

// MARK: - Alert Handler
extension JuiceOrderViewController {
    private func tappedYesButton(action: UIAlertAction) {
        navigateToFruitStockViewController()
    }
}
