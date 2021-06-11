//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.strawberry] ?? 0)
        bananaStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.banana] ?? 0)
        pineappleStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.pineapple] ?? 0)
        kiwiStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.kiwi] ?? 0)
        mangoStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.mango] ?? 0)
    }
    
    func showMenuServingAlert(recipe: JuiceMaker.JuiceRecipe) {
        let alert = UIAlertController(title: nil, message: "\(recipe.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "감사합니다", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showEmptyStockAlert(recipe: JuiceMaker.JuiceRecipe) {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default)
        let noAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func strawberryJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .strawberryJuice)
            strawberryStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.strawberry] ?? 0)
            showMenuServingAlert(recipe: .strawberryJuice)
        } catch {
            showEmptyStockAlert(recipe: .strawberryJuice)
        }
    }
    
    @IBAction func bananaJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .bananaJuice)
            bananaStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.banana] ?? 0)
            showMenuServingAlert(recipe: .bananaJuice)
        } catch {
            showEmptyStockAlert(recipe: .bananaJuice)
        }
    }
    
    @IBAction func pineappleJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .pineappleJuice)
            pineappleStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.pineapple] ?? 0)
            showMenuServingAlert(recipe: .pineappleJuice)
        } catch {
            showEmptyStockAlert(recipe: .pineappleJuice)
        }
    }
    
    @IBAction func kiwiJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .kiwiJuice)
            kiwiStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.kiwi] ?? 0)
            showMenuServingAlert(recipe: .kiwiJuice)
        } catch {
            showEmptyStockAlert(recipe: .kiwiJuice)
        }
    }
    
    
    @IBAction func mangoJuiceButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .mangoJuice)
            mangoStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.mango] ?? 0)
            showMenuServingAlert(recipe: .mangoJuice)
        } catch {
            showEmptyStockAlert(recipe: .mangoJuice)
        }
    }
    @IBAction func strawberryBananaButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .strawberryBananaJuice)
            strawberryStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.strawberry] ?? 0)
            bananaStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.banana] ?? 0)
            showMenuServingAlert(recipe: .strawberryBananaJuice)
        } catch {
            showEmptyStockAlert(recipe: .strawberryBananaJuice)
        }
    }
    @IBAction func mangoKiwiButton(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(recipe: .mangoKiwiJuice)
            mangoStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.mango] ?? 0)
            kiwiStockLabel.text = String(juiceMaker.fruitstore.fruitStock[.kiwi] ?? 0)
            showMenuServingAlert(recipe: .mangoKiwiJuice)
        } catch {
            showEmptyStockAlert(recipe: .mangoKiwiJuice)
        }
    }
    
 
}

