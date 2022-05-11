//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MakeJuiceViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLable: UILabel!
    @IBOutlet weak var bananaStockLable: UILabel!
    @IBOutlet weak var pineappleStockLable: UILabel!
    @IBOutlet weak var kiwiStockLable: UILabel!
    @IBOutlet weak var mangoStockLable: UILabel!
    
    @IBOutlet weak var strawBerryBananJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    @IBAction private func didTapOrderJuice(_ sender: UIButton) {
        do {
            let order = try orderJuice(sender: sender)
            makeJuice(fruit: order)
            for (fruit, _) in order.recipe {
                let stock = selectFruitLable(fruit: fruit)
                stock.text = showFruitsStock(name: fruit)
            }
        } catch FruitStoreError.wrongMenu {
            print("없는 메뉴입니다")
        } catch {
            print("")
        }
    }
    
    private func updateViews() {
        strawberryStockLable.text = showFruitsStock(name: .strawberry)
        bananaStockLable.text = showFruitsStock(name: .banana)
        pineappleStockLable.text = showFruitsStock(name: .pineapple)
        kiwiStockLable.text = showFruitsStock(name: .kiwi)
        mangoStockLable.text = showFruitsStock(name: .mango)
    }
    
    private func showFruitsStock(name: Fruit) -> String {
        return FruitStore.shared.showFruitsStock(name: name)
    }
    
    private func selectFruitLable(fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStockLable
        case .mango:
            return mangoStockLable
        case .kiwi:
            return kiwiStockLable
        case .pineapple:
            return pineappleStockLable
        case .banana:
            return bananaStockLable
        }
    }
    
    private func orderJuice(sender: UIButton) throws -> Juice {
        switch sender {
        case strawBerryBananJuiceButton:
            return .strawberryBanana
        case mangoKiwiJuiceButton:
            return .mangoKiwi
        case strawberryJuiceButton:
            return .strawberry
        case bananaJuiceButton:
            return .banana
        case pineappleJuiceButton:
            return .pineapple
        case kiwiJuiceButton:
            return .kiwi
        case mangoJuiceButton:
            return .mango
        default:
            throw FruitStoreError.wrongMenu
        }
    }
    
    private func showMakeJuiceMessage(message: String) {
        let makeJuiceMessage = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        makeJuiceMessage.addAction(okButton)
        present(makeJuiceMessage, animated: true, completion: nil)
    }
    
    private func showCheckStockMessage() {
        let checkStockMessage = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "예", style: .default) { _ in
            self.performSegue(withIdentifier: "showFruitStockSegue", sender: nil)
        }
        let noButton = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        checkStockMessage.addAction(yesButton)
        checkStockMessage.addAction(noButton)
        present(checkStockMessage, animated: true, completion: nil)
    }
    
    private func makeJuice(fruit: Juice) {
        if juiceMaker.canMakeJuice(flavor: fruit) {
            showMakeJuiceMessage(message: "\(fruit.name) 나왔습니다! 맛있게 드세요!")
        } else {
            showCheckStockMessage()
        }
    }
}

