//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Rhode, Christy Lee on 2023/01/09.
//

import UIKit

class StockModifyViewController: UIViewController {
    
    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryStockUILabel: UILabel!
    @IBOutlet weak var bananaStockUILabel: UILabel!
    @IBOutlet weak var pineappleStockUILabel: UILabel!
    @IBOutlet weak var kiwiStockUILabel: UILabel!
    @IBOutlet weak var mangoStockUILabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStocks()
        setStock()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        displayStocks()
//        setStock()
//    }
    
    @IBAction func touchFruitStockStepper(_ sender: UIStepper) {
        modifyStockTapped(tag: sender.tag)
    }
    
    func displayStocks() {
        if let strawberry = fruitStore.fruitStock[.딸기] {
            strawberryStockUILabel.text = String(strawberry)
        }
        if let banana = fruitStore.fruitStock[.바나나] {
            bananaStockUILabel.text = String(banana)
        }
        if let pineapple = fruitStore.fruitStock[.파인애플] {
            pineappleStockUILabel.text = String(pineapple)
        }
        if let kiwi = fruitStore.fruitStock[.키위] {
            kiwiStockUILabel.text = String(kiwi)
        }
        if let mango = fruitStore.fruitStock[.망고] {
            mangoStockUILabel.text = String(mango)
        }
    }
    
    func setStock() {
        if let strawberry = fruitStore.fruitStock[.딸기] {
            strawberryStepper.value = Double(strawberry)
        }
        if let banana = fruitStore.fruitStock[.바나나] {
            bananaStepper.value = Double(banana)
        }
        if let pineapple = fruitStore.fruitStock[.파인애플] {
            pineappleStepper.value = Double(pineapple)
        }
        if let kiwi = fruitStore.fruitStock[.키위] {
            kiwiStepper.value = Double(kiwi)
        }
        if let mango = fruitStore.fruitStock[.망고] {
            mangoStepper.value = Double(mango)
        }
    }
    
    func modifyStockTapped(tag: Int) {
        switch tag {
        case 0:
            fruitStore.modifyFruitStocks(fruit: .딸기, amount: Int(strawberryStepper.value))
            strawberryStockUILabel.text = String(Int(strawberryStepper.value))
        case 1:
            fruitStore.modifyFruitStocks(fruit: .바나나, amount: Int(bananaStepper.value))
            bananaStockUILabel.text = String(Int(bananaStepper.value))
        case 2:
            fruitStore.modifyFruitStocks(fruit: .파인애플, amount: Int(pineappleStepper.value))
            pineappleStockUILabel.text = String(Int(pineappleStepper.value))
        case 3:
            fruitStore.modifyFruitStocks(fruit: .키위, amount: Int(kiwiStepper.value))
            kiwiStockUILabel.text = String(Int(kiwiStepper.value))
        case 4:
            fruitStore.modifyFruitStocks(fruit: .망고, amount: Int(mangoStepper.value))
            mangoStockUILabel.text = String(Int(mangoStepper.value))
        default:
            break
        }
    }
}
