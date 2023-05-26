//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by EtialMoon, 비모 on 2023/05/16.
//

import UIKit

final class FruitStockViewController: UIViewController {

    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryStockStepper: UIStepper!
    @IBOutlet private weak var bananaStockStepper: UIStepper!
    @IBOutlet private weak var pineappleStockStepper: UIStepper!
    @IBOutlet private weak var kiwiStockStepper: UIStepper!
    @IBOutlet private weak var mangoStockStepper: UIStepper!
    
    weak var delegate: FruitStockDelegate?
    var fruitStock: [Fruit : Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFruitStock()
        setStepperTag()
    }
    
    @IBAction private func tabCloseButton(_ sender: UIBarButtonItem) {
        delegate?.change(fruitStock)
        
        dismiss(animated: true)
    }
    
    @IBAction private func tapStockChangeStepper(_ sender: UIStepper) {
        do {
            let fruit = try matchFruit(by: sender.tag)
            
            fruitStock[fruit] = Int(sender.value)
            setFruitStock()
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            default:
                print("알 수 없는 에러")
            }
            
            let alert = AlertBuilder()
                .setMessage("과일 수량 변경에 실패했습니다.")
                .addAction(title: "확인", style: .default)
                .build()
            
            present(alert, animated: true)
        }
    }
    
    private func setFruitStock() {
        let strawberryStock = fruitStock[.strawberry] ?? 0
        let bananaStock = fruitStock[.banana] ?? 0
        let pineappleStock = fruitStock[.pineapple] ?? 0
        let kiwiStock = fruitStock[.kiwi] ?? 0
        let mangoStock = fruitStock[.mango] ?? 0
        
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
    
    private func setStepperTag() {
        strawberryStockStepper.tag = 0
        bananaStockStepper.tag = 1
        pineappleStockStepper.tag = 2
        kiwiStockStepper.tag = 3
        mangoStockStepper.tag = 4
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
