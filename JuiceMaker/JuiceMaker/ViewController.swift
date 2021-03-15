//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var strawberryStock: StockLabel!
    @IBOutlet var bananaStock: StockLabel!
    @IBOutlet var pineappleStock: StockLabel!
    @IBOutlet var kiwiStock: StockLabel!
    @IBOutlet var mangoStock: StockLabel!
    
    @IBOutlet var strawBananaButton: JuiceOrderButton!
    @IBOutlet var mangoKiwiButton: JuiceOrderButton!
    @IBOutlet var strawberryButton: JuiceOrderButton!
    @IBOutlet var bananaButton: JuiceOrderButton!
    @IBOutlet var pineappleButton: JuiceOrderButton!
    @IBOutlet var kiwiButton: JuiceOrderButton!
    @IBOutlet var mangoButton: JuiceOrderButton!
    
    @IBAction func touchUpJuiceButton(_ sender: JuiceOrderButton) {
        if sender.juice.canMake {
            JuiceMaker.make(menu: sender.juice)
            //successAlert(typeOfJuice: sender.juice)
            showAlert(OrderAlert.successAlert(typeOfJuice: sender.juice))
        } else {
            showAlert(OrderAlert.failAlert())
        }
        update()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeStockLabel()
        initializeJuiceOrderButton()
    }
    
    private func showAlert(_ alert: UIAlertController) {
        present(alert, animated: false, completion: nil)
    }
    
    private func update() {
        strawberryStock.text = String(FruitType.strawberry.stock)
        bananaStock.text = String(FruitType.banana.stock)
        pineappleStock.text = String(FruitType.pineapple.stock)
        kiwiStock.text = String(FruitType.kiwi.stock)
        mangoStock.text = String(FruitType.mango.stock)
    }
    
    private func initializeStockLabel() {
        strawberryStock.fruit = FruitType.strawberry
        bananaStock.fruit = FruitType.banana
        pineappleStock.fruit = FruitType.pineapple
        kiwiStock.fruit = FruitType.kiwi
        mangoStock.fruit = FruitType.mango
    }
    
    private func initializeJuiceOrderButton() {
        strawBananaButton.juice = JuiceType.strawBanana
        mangoKiwiButton.juice = JuiceType.mangoKiwi
        strawberryButton.juice = JuiceType.strawberry
        bananaButton.juice = JuiceType.banana
        pineappleButton.juice = JuiceType.pineapple
        kiwiButton.juice = JuiceType.kiwi
        mangoButton.juice = JuiceType.mango
    }
}


