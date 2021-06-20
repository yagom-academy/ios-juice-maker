//
//  StoreController.swift
//  JuiceMaker
//
//  Created by kjs on 2021/06/18.
//

import Foundation
import UIKit

class StoreController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeTextOn(label: strawberryStockLabel, about: .strawberry)
        changeTextOn(label: bananaStockLabel, about: .banana)
        changeTextOn(label: kiwiStockLabel, about: .kiwi)
        changeTextOn(label: mangoStockLabel, about: .mango)
        changeTextOn(label: pineappleStockLabel, about: .pineapple)
        
        guard let strawberryStore = findFruitStore(about: Fruit.strawberry),
              let bananaStore = findFruitStore(about: Fruit.banana),
              let pineappleStore = findFruitStore(about: Fruit.pineapple),
              let kiwiStore = findFruitStore(about: Fruit.kiwi),
              let mangoStore = findFruitStore(about: Fruit.mango)
        else {
            return
        }
        
        strawberryStepper.value = Double( strawberryStore.stock )
        bananaStepper.value = Double( bananaStore.stock )
        pineappleStepper.value = Double( pineappleStore.stock )
        kiwiStepper.value = Double( kiwiStore.stock )
        mangoStepper.value = Double( mangoStore.stock )
        
        self.navigationItem.title = "재고수정"
        self.navigationItem.hidesBackButton = true
    }
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBAction func exitFuirtStore(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changedStrawberryStock(_ sender: UIStepper) {
        guard let store = findFruitStore(about: Fruit.strawberry) else {
            return
        }
        
        store.setStock(amount: Int(sender.value) - store.stock )
        
        changeTextOn(label: strawberryStockLabel, about: .strawberry)
    }
    
    @IBAction func changedPineappleStock(_ sender: UIStepper) {
        guard let store = findFruitStore(about: Fruit.pineapple) else {
            return
        }
        
        store.setStock(amount: Int(sender.value) - store.stock )
        
        changeTextOn(label: pineappleStockLabel, about: .pineapple)
    }
    
    
    @IBAction func changedMangoStock(_ sender: UIStepper) {
        guard let store = findFruitStore(about: Fruit.mango) else {
            return
        }
        
        store.setStock(amount: Int(sender.value) - store.stock )
        
        changeTextOn(label: mangoStockLabel, about: .mango)
    }
    
    @IBAction func changedKiwiStock(_ sender: UIStepper) {
        guard let store = findFruitStore(about: Fruit.kiwi) else {
            return
        }
        
        store.setStock(amount: Int(sender.value) - store.stock )
        
        changeTextOn(label: kiwiStockLabel, about: .kiwi)
    }
    
    @IBAction func changedBananaStock(_ sender: UIStepper) {
        guard let store = findFruitStore(about: Fruit.banana) else {
            return
        }
        
        store.setStock(amount: Int(sender.value) - store.stock )
        
        changeTextOn(label: bananaStockLabel, about: .banana)
    }
    
    func findFruitStore(about: Fruit) -> FruitStore? {
        return ViewController
            .juiceMaker
            .fruitStores
            .filter({ store in
                store.name == about
            }).first
    }
    
    func changeTextOn(label: UILabel, about fruit: Fruit) {
        let fruitStore = ViewController.juiceMaker.fruitStores.filter { $0.name == fruit }.first
        if let stockLeft = fruitStore?.stock {
            label.text = "\(stockLeft)"
        }
    }
    
}
