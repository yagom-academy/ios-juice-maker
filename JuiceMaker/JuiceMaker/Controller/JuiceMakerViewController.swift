//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController, UpdateLabelsDelegate {

    @IBOutlet weak private var strawberryJuiceButton: UIButton!
    @IBOutlet weak private var bananaJuiceButton: UIButton!
    @IBOutlet weak private var kiwiJuiceButton: UIButton!
    @IBOutlet weak private var pineappleJuiceButton: UIButton!
    @IBOutlet weak private var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak private var mangoJuiceButton: UIButton!
    @IBOutlet weak private var mangoKiwiJuiceButton: UIButton!
    
    @IBOutlet weak private var strawberryCountLabel: UILabel!
    @IBOutlet weak private var bananaCountLabel: UILabel!
    @IBOutlet weak private var kiwiCountLabel: UILabel!
    @IBOutlet weak private var pineappleCountLabel: UILabel!
    @IBOutlet weak private var mangoCountLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared
    
    private var juiceButtonsDictionary: [UIButton: Juice] = [:]
    private var fruitLabelsDictionary: [Fruit: UILabel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defineDictionary()
        configureFruitCountLabels()
    }
    
    @IBAction private func touchUpEditStockButton(_ sender: UIBarButtonItem) {
        presentStockManager()
    }
    
    @IBAction private func touchUpJuiceOrderButton(_ sender: UIButton) {
        guard let juice = juiceButtonsDictionary[sender] else { return }
        
        do {
            try juiceMaker.makeJuice(for: juice)
            presentOrderSuccessAlert(juice: juice)
            updateFruitCountLabels(juice: juice)
        } catch {
            presentOrderFailureAlert()
        }
    }
    
    private func defineDictionary() {
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
    
    private func updateFruitCountLabels(juice: Juice) {
        for fruit in juice.recipe.keys {
            fruitLabelsDictionary[fruit]?.text = fruitStore.getStockCountToString(of: fruit)
        }
    }
    
    private func presentStockManager() {
        guard let stockManagerNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerNavigationController") as? UINavigationController else { return }
        
        guard let stockManagerViewController = stockManagerNavigationController.viewControllers.first as? StockManagerViewController else { return }

        stockManagerViewController.juiceMakerViewControllerDelegate = self        
        stockManagerNavigationController.modalPresentationStyle = .fullScreen
        
        self.present(stockManagerNavigationController, animated: true)
    }
    
    private func presentOrderSuccessAlert(juice: Juice) {
        let message = "\(juice.rawValue) 나왔습니다! 맛있게 드세요!"
               
        let alert = UIAlertController(title: "알림",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true)
    }
    
    private func presentOrderFailureAlert() {
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
