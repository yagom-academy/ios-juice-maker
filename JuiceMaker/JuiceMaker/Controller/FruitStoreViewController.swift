//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by EtialMoon, 비모 on 2023/05/16.
//

import UIKit

protocol FruitStoreDelegate: AnyObject {
    func changeStock()
}

final class FruitStoreViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bananaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    var fruits: [Fruit : Int]?
    weak var delegate: FruitStoreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFruitStock()
    }
    
    @IBAction func tabClose(_ sender: UIBarButtonItem) {
        delegate?.changeStock()
        
        dismiss(animated: true)
    }
    
    @IBAction func tapChangeStock(_ sender: UIStepper) {
        do {
            let fruit = try matchFruit(by: sender.tag)
            fruits?[fruit] = Int(sender.value)
            setFruitStock()
        } catch {
            // TODO: 에러 처리
        }
    }
    
    private func setFruitStock() {
        if let fruits, !fruits.isEmpty {
            let strawberryStock = fruits[.strawberry] ?? 0
            let bananaStock = fruits[.banana] ?? 0
            let pineappleStock = fruits[.pineapple] ?? 0
            let kiwiStock = fruits[.kiwi] ?? 0
            let mangoStock = fruits[.mango] ?? 0
            
            strawberryStockLabel.text = String(strawberryStock)
            bananaStockLabel.text = String(bananaStock)
            pineappleStockLabel.text = String(pineappleStock)
            kiwiStockLabel.text = String(kiwiStock)
            mangoStockLabel.text = String(mangoStock)
            
            strawberryStockStepper.value = Double(strawberryStock)
            bananaStockStepper.value = Double(bananaStock)
            pineappleStockStepper.value = Double(pineappleStock)
            kiwiStockStepper.value = Double(kiwiStock)
            mangoStockStepper.value = Double(mangoStock)
        }
    }
    
    private func matchFruit(by tag: Int) throws -> Fruit {
        switch tag {
        case 0:
            return .strawberry
        case 1:
            return .banana
        case 2:
            return .pineapple
        case 3:
            return .kiwi
        case 4:
            return .mango
        default:
            throw JuiceError.nonexistentFruit
        }
    }
}
