//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    let fruitStore = FruitStore.shared
    
    var juiceButtonsDictionary: [UIButton: Juice] = [:]
    var fruitLabelsDictionary: [Fruit: UILabel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defineDictionary()
        configureFruitCountLabels()
    }
    
    @IBAction func touchUpEditStockButton(_ sender: UIBarButtonItem) {
        presentStockManager()
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        guard let juice = juiceButtonsDictionary[sender] else { return }
        
        do {
            try juiceMaker.makeJuice(for: juice)
        } catch {
            presentOrderFailureAlert()
            return
        }
        presentOrderSuccessAlert(juice: juice)
        updateFruitCountLabels(juice: juice)
    }
    
    func defineDictionary() {
        juiceButtonsDictionary = [
            strawberryJuiceButton: .strawberryJuice,
            bananaJuiceButton: .bananaJuice,
            kiwiJuiceButton: .kiwiJuice,
            pineappleJuiceButton: .pineappleJuice,
            mangoKiwiJuiceButton: .mangoKiwiJuice,
            mangoJuiceButton: .mangoJuice,
            strawberryBananaJuiceButton: .strawberryBananaJuice
        ]
        
        fruitLabelsDictionary = [
            .strawberry: strawberryCountLabel,
            .banana: bananaCountLabel,
            .kiwi: kiwiCountLabel,
            .pineapple: pineappleCountLabel,
            .mango: mangoCountLabel
        ]
    }
    
    func configureFruitCountLabels() {
        for fruit in Fruit.allCases {
            fruitLabelsDictionary[fruit]?.text = fruitStore.getStockCountToString(of: fruit)
        }
    }
    
    func updateFruitCountLabels(juice: Juice) {
        for fruit in juice.recipe.keys {
            fruitLabelsDictionary[fruit]?.text = fruitStore.getStockCountToString(of: fruit)
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
        
        self.present(alert, animated: true)
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
        
        self.present(alert, animated: true)
    }
}
