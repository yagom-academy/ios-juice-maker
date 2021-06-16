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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .strawberry))
        bananaStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .banana))
        pineappleStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .pineapple))
        kiwiStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .kiwi))
        mangoStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .mango))
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
        do {
            try juiceMaker.makeJuice(recipe: .strawberryJuice)
            strawberryStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .strawberry))
            showMenuServingAlert(recipe: .strawberryJuice)
        } catch {
            showEmptyStockAlert(recipe: .strawberryJuice)
        }
    }
    
    @IBAction func bananaJuiceButtonDidTap(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .bananaJuice)
            bananaStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .banana))
            showMenuServingAlert(recipe: .bananaJuice)
        } catch {
            showEmptyStockAlert(recipe: .bananaJuice)
        }
    }
    
    @IBAction func pineappleJuiceButtonDidTap(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .pineappleJuice)
            pineappleStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .pineapple))
            showMenuServingAlert(recipe: .pineappleJuice)
        } catch {
            showEmptyStockAlert(recipe: .pineappleJuice)
        }
    }
    
    @IBAction func kiwiJuiceButtonDidTap(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .kiwiJuice)
            kiwiStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .kiwi))
            showMenuServingAlert(recipe: .kiwiJuice)
        } catch {
            showEmptyStockAlert(recipe: .kiwiJuice)
        }
    }
    
    
    @IBAction func mangoJuiceButtonDidTap(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .mangoJuice)
            mangoStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .mango))
            showMenuServingAlert(recipe: .mangoJuice)
        } catch {
            showEmptyStockAlert(recipe: .mangoJuice)
        }
    }
    
    @IBAction func strawberryBananaButtonDidTap(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .strawberryBananaJuice)
            strawberryStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .strawberry))
            bananaStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .banana))
            showMenuServingAlert(recipe: .strawberryBananaJuice)
        } catch {
            showEmptyStockAlert(recipe: .strawberryBananaJuice)
        }
    }
    
    @IBAction func mangoKiwiButtonDidTap(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .mangoKiwiJuice)
            mangoStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .mango))
            kiwiStockLabel.text = String(juiceMaker.fruitstore.stockAmount(fruit: .kiwi))
            showMenuServingAlert(recipe: .mangoKiwiJuice)
        } catch {
            showEmptyStockAlert(recipe: .mangoKiwiJuice)
        }
    }
}
