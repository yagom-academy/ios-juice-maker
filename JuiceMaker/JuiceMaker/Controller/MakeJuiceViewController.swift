//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class makeJuiceViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStock.text = showFruitsStock(name: .strawberry)
        bananaStock.text = showFruitsStock(name: .banana)
        pineappleStock.text = showFruitsStock(name: .pineapple)
        kiwiStock.text = showFruitsStock(name: .kiwi)
        mangoStock.text = showFruitsStock(name: .mango)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        decideMessage(fruit: .strawberryBanana)
        strawberryStock.text = showFruitsStock(name: .strawberry)
        bananaStock.text = showFruitsStock(name: .banana)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        decideMessage(fruit: .mangoKiwi)
        mangoStock.text = showFruitsStock(name: .mango)
        kiwiStock.text = showFruitsStock(name: .kiwi)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        decideMessage(fruit: .strawberry)
        strawberryStock.text = showFruitsStock(name: .strawberry)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        decideMessage(fruit: .banana)
        bananaStock.text = showFruitsStock(name: .banana)
    }
    
    @IBAction func orderPineapplerJuice(_ sender: UIButton) {
        decideMessage(fruit: .pineapple)
        pineappleStock.text = showFruitsStock(name: .pineapple)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        decideMessage(fruit: .kiwi)
        kiwiStock.text = showFruitsStock(name: .kiwi)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        decideMessage(fruit: .mango)
        mangoStock.text = showFruitsStock(name: .mango)
    }
    
    func showFruitsStock(name: Fruits) -> String {
        return juiceMaker.fruitStore.showFruitsStock(name: name)
    }
    
    func showMakeJuiceMessage(from message: String) {
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
    
    func decideMessage(fruit: Juice) {
        if juiceMaker.canMakeJuice(flavor: fruit) {
            showMakeJuiceMessage(from: "\(fruit.name) 나왔습니다! 맛있게 드세요!")
        } else {
            showCheckStockMessage()
        }
    }
}

