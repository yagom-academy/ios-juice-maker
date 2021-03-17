//
//  Controller.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/16.
//

import UIKit

//MARK:- Contoller

extension MainViewController {
    @IBAction func touchUpJuiceButton(_ sender: JuiceOrderButton) {
        if sender.juice.canMake {
            JuiceMaker.make(menu: sender.juice)
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
