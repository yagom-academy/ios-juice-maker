//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Rhode, Christy Lee on 2023/01/09.
//

import UIKit

final class StockModifyViewController: UIViewController {
    
    private let fruitStore = FruitStore.shared
    
    @IBOutlet weak private var strawberryStockUILabel: UILabel!
    @IBOutlet weak private var bananaStockUILabel: UILabel!
    @IBOutlet weak private var pineappleStockUILabel: UILabel!
    @IBOutlet weak private var kiwiStockUILabel: UILabel!
    @IBOutlet weak private var mangoStockUILabel: UILabel!
    
    @IBOutlet weak private var strawberryStepper: UIStepper!
    @IBOutlet weak private var bananaStepper: UIStepper!
    @IBOutlet weak private var pineappleStepper: UIStepper!
    @IBOutlet weak private var kiwiStepper: UIStepper!
    @IBOutlet weak private var mangoStepper: UIStepper!
    
    @IBOutlet weak private var closeButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelStock()
        setStepperStock()
        setStepperSize()
    }
   
    private func setLabelStock() {
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
    
    private func setStepperStock() {
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
    
    private func setStepperSize() {
        strawberryStepper.transform = strawberryStepper.transform.scaledBy(x: 1.25, y: 1.25)
        bananaStepper.transform = bananaStepper.transform.scaledBy(x: 1.25, y: 1.25)
        pineappleStepper.transform = pineappleStepper.transform.scaledBy(x: 1.25, y: 1.25)
        kiwiStepper.transform = kiwiStepper.transform.scaledBy(x: 1.25, y: 1.25)
        mangoStepper.transform = mangoStepper.transform.scaledBy(x: 1.25, y: 1.25)
    }
    
    @IBAction private func touchFruitStockStepper(_ sender: UIStepper) {
        modifyStockTapped(tag: sender.tag)
    }
    
    @IBAction func touchCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    private func modifyStockTapped(tag: Int) {
        switch tag {
        case Tag.딸기.rawValue:
            fruitStore.modifyFruitStocks(fruit: .딸기, amount: Int(strawberryStepper.value))
            strawberryStockUILabel.text = String(Int(strawberryStepper.value))
        case Tag.바나나.rawValue:
            fruitStore.modifyFruitStocks(fruit: .바나나, amount: Int(bananaStepper.value))
            bananaStockUILabel.text = String(Int(bananaStepper.value))
        case Tag.파인애플.rawValue:
            fruitStore.modifyFruitStocks(fruit: .파인애플, amount: Int(pineappleStepper.value))
            pineappleStockUILabel.text = String(Int(pineappleStepper.value))
        case Tag.키위.rawValue:
            fruitStore.modifyFruitStocks(fruit: .키위, amount: Int(kiwiStepper.value))
            kiwiStockUILabel.text = String(Int(kiwiStepper.value))
        case Tag.망고.rawValue:
            fruitStore.modifyFruitStocks(fruit: .망고, amount: Int(mangoStepper.value))
            mangoStockUILabel.text = String(Int(mangoStepper.value))
        default:
            break
        }
    }
}

extension StockModifyViewController {
    enum Tag: Int {
        case 딸기
        case 바나나
        case 파인애플
        case 키위
        case 망고
    }
}
