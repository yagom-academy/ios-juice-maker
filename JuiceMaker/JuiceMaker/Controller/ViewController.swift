//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    func checkFruitsStock(name: Fruits) -> String{
        return juiceMaker.fruitStore.checkFruitsStock(name: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStock.text = checkFruitsStock(name: .strawberry)
        bananaStock.text = checkFruitsStock(name: .banana)
        pineappleStock.text = checkFruitsStock(name: .pineapple)
        kiwiStock.text = checkFruitsStock(name: .kiwi)
        mangoStock.text = checkFruitsStock(name: .mango)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        decideMessage(fruit: .strawberryBanana)
        strawberryStock.text = checkFruitsStock(name: .strawberry)
        bananaStock.text = checkFruitsStock(name: .banana)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        decideMessage(fruit: .mangoKiwi)
        mangoStock.text = checkFruitsStock(name: .mango)
        kiwiStock.text = checkFruitsStock(name: .kiwi)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        decideMessage(fruit: .strawberry)
        strawberryStock.text = checkFruitsStock(name: .strawberry)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        decideMessage(fruit: .banana)
        bananaStock.text = checkFruitsStock(name: .banana)
    }
    
    @IBAction func orderPineapplerJuice(_ sender: UIButton) {
        decideMessage(fruit: .pineapple)
        pineappleStock.text = checkFruitsStock(name: .pineapple)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        decideMessage(fruit: .kiwi)
        kiwiStock.text = checkFruitsStock(name: .kiwi)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        decideMessage(fruit: .mango)
        mangoStock.text = checkFruitsStock(name: .mango)
    }
    
    @IBAction func changeStockButton(_ sender: UIBarButtonItem) {
        
    }
    
    func showMakeJuiceMessage(from message: String) {
        let makeJuiceMessage = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        makeJuiceMessage.addAction(okButton)
        present(makeJuiceMessage, animated: true, completion: nil)
    }
    
    func showCheckStockMessage() {
        let checkStockMessage = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "예", style: .default) { _ in
            self.performSegue(withIdentifier: "showFruitStock", sender: nil)
        }
        let noButton = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        checkStockMessage.addAction(yesButton)
        checkStockMessage.addAction(noButton)
        present(checkStockMessage, animated: true, completion: nil)
    }
    
    func decideMessage(fruit: Juice) {
        if juiceMaker.makeJuice(flavor: fruit) {
            showMakeJuiceMessage(from: "dd")
        } else {
            showCheckStockMessage()
        }
    }
}

