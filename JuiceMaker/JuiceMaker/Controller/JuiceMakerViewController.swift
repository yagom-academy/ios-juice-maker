//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    @IBOutlet weak var strawberryJuiceButton: JuiceOrderButton!
    @IBOutlet weak var bananaJuiceButton: JuiceOrderButton!
    @IBOutlet weak var kiwiJuiceButton: JuiceOrderButton!
    @IBOutlet weak var pineappleJuiceButton: JuiceOrderButton!
    @IBOutlet weak var strawberryBananaJuiceButton: JuiceOrderButton!
    @IBOutlet weak var mangoJuiceButton: JuiceOrderButton!
    @IBOutlet weak var mangoKiwiJuiceButton: JuiceOrderButton!
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    let fruitStore = FruitStore.shared
    
    var buttonDic: [Juice: JuiceOrderButton] = [:]
    var labelDic: [Fruit: UILabel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignJuiceTypeAtJuiceOrderButton()
        configureFruitCountLabels()
        
        buttonDic = [
            .strawberryJuice: strawberryJuiceButton,
            .bananaJuice: bananaJuiceButton,
            .kiwiJuice: kiwiJuiceButton,
            .pineappleJuice: pineappleJuiceButton,
            .mangoKiwiJuice: mangoKiwiJuiceButton,
            .mangoJuice: mangoJuiceButton,
            .strawberryBananaJuice: strawberryBananaJuiceButton
        ]
        
        labelDic = [
            .strawberry: strawberryCountLabel,
            .banana: bananaCountLabel,
            .kiwi: kiwiCountLabel,
            .pineapple: pineappleCountLabel,
            .mango: mangoCountLabel
        ]
    }
    
    @IBAction func touchUpEditStockButton(_ sender: UIBarButtonItem) {
        presentStockManager()
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: JuiceOrderButton) {
        guard let juice = sender.juice else { return }
        
        do {
            try juiceMaker.makeJuice(for: juice)
        } catch {
            presentOrderFailureAlert()
            return
        }
        presentOrderSuccessAlert(juice: juice)
        //configureFruitCountLabels()
        updateFruitCountLabels(juice: juice)
    }
    
    func assignJuiceTypeAtJuiceOrderButton() {
        strawberryJuiceButton.juice = .strawberryJuice
        bananaJuiceButton.juice = .bananaJuice
        kiwiJuiceButton.juice = .kiwiJuice
        pineappleJuiceButton.juice = .pineappleJuice
        strawberryBananaJuiceButton.juice = .strawberryBananaJuice
        mangoJuiceButton.juice = .mangoJuice
        mangoKiwiJuiceButton.juice = .mangoKiwiJuice
    }
    
    func configureFruitCountLabels() {
        strawberryCountLabel.text = fruitStore.getStockCountToString(of: .strawberry)
        bananaCountLabel.text = fruitStore.getStockCountToString(of: .banana)
        kiwiCountLabel.text = fruitStore.getStockCountToString(of: .kiwi)
        pineappleCountLabel.text = fruitStore.getStockCountToString(of: .pineapple)
        mangoCountLabel.text = fruitStore.getStockCountToString(of: .mango)
    }
    
    func updateFruitCountLabels(juice: Juice) {
        for fruit in juice.recipe.keys {
            labelDic[fruit]?.text = fruitStore.getStockCountToString(of: fruit)
        }
    }
    
    func presentStockManager() {
        guard let stockManagerNC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerNavigationController") as? UINavigationController else { return }
                        
        self.present(stockManagerNC, animated: true)
    }
    
    func presentOrderSuccessAlert(juice: Juice) {
        let message = "\(juice.rawValue) 나왔습니다! 맛있게 드세요!"
               
        let alert = UIAlertController(title: "알림",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentOrderFailureAlert() {
        let alert = UIAlertController(title: "알림",
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            self.presentStockManager()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

class JuiceOrderButton: UIButton {
    var juice: Juice?
}
