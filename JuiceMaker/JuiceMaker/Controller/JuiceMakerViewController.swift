//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 
import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.sharedInstance
    
    override func viewWillAppear(_ animated: Bool) {
        configureAllLabelText()
    }
    
    private func configureAllLabelText() {
        strawberryStockLabel.text = String(fruitStore.stockAmount(fruit: .strawberry))
        bananaStockLabel.text = String(fruitStore.stockAmount(fruit: .banana))
        pineappleStockLabel.text = String(fruitStore.stockAmount(fruit: .pineapple))
        kiwiStockLabel.text = String(fruitStore.stockAmount(fruit: .kiwi))
        mangoStockLabel.text = String(fruitStore.stockAmount(fruit: .mango))
    }
    
    private func showMenuServingAlert(recipe: JuiceMaker.JuiceRecipe) {
        let alert = UIAlertController(title: nil, message: "\(recipe.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "감사합니다", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showEmptyStockAlert(recipe: JuiceMaker.JuiceRecipe) {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        guard let modalViewController = self.storyboard?.instantiateViewController(identifier: "StockEdit") else { return }
        modalViewController.modalPresentationStyle = .fullScreen
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            self.present(modalViewController, animated: true)
        }
        let noAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func strawberryJuiceButtonDidTap(_ sender: UIButton) {
        makingJuice(recipe: .strawberryJuice)
        strawberryStockLabel.text = String(fruitStore.stockAmount(fruit: .strawberry))
    }
    
    @IBAction func bananaJuiceButtonDidTap(_ sender: UIButton) {
        makingJuice(recipe: .bananaJuice)
        bananaStockLabel.text = String(fruitStore.stockAmount(fruit: .banana))
    }
    
    @IBAction func pineappleJuiceButtonDidTap(_ sender: UIButton) {
        makingJuice(recipe: .pineappleJuice)
        pineappleStockLabel.text = String(fruitStore.stockAmount(fruit: .pineapple))
    }
    
    @IBAction func kiwiJuiceButtonDidTap(_ sender: UIButton) {
        makingJuice(recipe: .kiwiJuice)
        kiwiStockLabel.text = String(fruitStore.stockAmount(fruit: .kiwi))
    }
    
    
    @IBAction func mangoJuiceButtonDidTap(_ sender: UIButton) {
        makingJuice(recipe: .mangoJuice)
        mangoStockLabel.text = String(fruitStore.stockAmount(fruit: .mango))
    }
    
    @IBAction func strawberryBananaButtonDidTap(_ sender: UIButton) {
        makingJuice(recipe: .strawberryBananaJuice)
        strawberryStockLabel.text = String(fruitStore.stockAmount(fruit: .strawberry))
        bananaStockLabel.text = String(fruitStore.stockAmount(fruit: .banana))
    }
    
    @IBAction func mangoKiwiButtonDidTap(_ sender: UIButton) {
        makingJuice(recipe: .mangoKiwiJuice)
        mangoStockLabel.text = String(fruitStore.stockAmount(fruit: .mango))
        kiwiStockLabel.text = String(fruitStore.stockAmount(fruit: .kiwi))
    }
    
    private func makingJuice(recipe: JuiceMaker.JuiceRecipe) {
        do {
            try juiceMaker.makeJuice(recipe: recipe)
            showMenuServingAlert(recipe: recipe)
        } catch {
            showEmptyStockAlert(recipe: recipe)
        }
    }
}

