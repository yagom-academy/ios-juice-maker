//
//  JuiceMaker - ViewController.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    private let fruitStore = FruitStore.shared
    private let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
        notificationCenter.addObserver(self,
                                       selector: #selector(updateStockLabel),
                                       name: .useFruitEvent,
                                       object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc private func updateStockLabel() {
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
        guard let editStockView = self.storyboard?.instantiateViewController( withIdentifier:
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
}

