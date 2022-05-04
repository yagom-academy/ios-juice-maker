//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MakeJuiceViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    @IBOutlet weak var strawBerryBananJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction func didTapOrderJuice(_ sender: UIButton) {
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
    
    func setupViews() {
        strawberryStock.text = showFruitsStock(name: .strawberry)
        bananaStock.text = showFruitsStock(name: .banana)
        pineappleStock.text = showFruitsStock(name: .pineapple)
        kiwiStock.text = showFruitsStock(name: .kiwi)
        mangoStock.text = showFruitsStock(name: .mango)
    }
    
    func showFruitsStock(name: Fruits) -> String {
        return juiceMaker.fruitStore.showFruitsStock(name: name)
    }
    
    func selectFruitLable(fruit: Fruits) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStock
        case .mango:
            return mangoStock
        case .kiwi:
            return kiwiStock
        case .pineapple:
            return pineappleStock
        case .banana:
            return bananaStock
        }
    }
    
    func orderJuice(sender: UIButton) throws -> Juice {
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
    
    func showMakeJuiceMessage(message: String) {
        let makeJuiceMessage = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        makeJuiceMessage.addAction(okButton)
        present(makeJuiceMessage, animated: true, completion: nil)
    }
    
    func showCheckStockMessage() {
        let checkStockMessage = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "예", style: .default) { action -> Void in
            let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockViewController")
            self.present(stockViewController!, animated: true, completion: nil)
        }
        let noButton = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        checkStockMessage.addAction(yesButton)
        checkStockMessage.addAction(noButton)
        present(checkStockMessage, animated: true, completion: nil)
    }
    
    func makeJuice(fruit: Juice) {
        if juiceMaker.canMakeJuice(flavor: fruit) {
            showMakeJuiceMessage(message: "\(fruit.name) 나왔습니다! 맛있게 드세요!")
        } else {
            showCheckStockMessage()
        }
    }
}

