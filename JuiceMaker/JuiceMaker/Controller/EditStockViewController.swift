//
//  JuiceMaker - EditStockViewController.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class EditStockViewController: UIViewController {
    static let identifier = "EditStockViewController"
    let fruitStore = FruitStore.shared
    
    // MARK: - 과일 재고 Label Outlet
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    // MARK: - 과일 재고 Label Outlet
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    //MARK: - ViewState Method
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
        settingStepper()
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
    
    }
    
    //MARK: - 화면 Label에 재고 Update
    private func updateStockLabel() {
        let fruits = fruitStore.fruits.mapValues{ String($0) }
       
        for fruit in Fruit.allCases {
            guard let label = returnLabel(of: fruit) else { return }
            label.text = fruits[fruit]
        }
    }
    
    //MARK: - 과일에 맞는 label, stepper 반환
    func returnLabel(of fruit: Fruit) -> UILabel? {
        let labelDictionary: [Fruit: UILabel] = [.strawberry: strawberryLabel,
                                                     .banana: bananaLabel,
                                                     .pineapple: pineappleLabel,
                                                     .mango: mangoLabel,
                                                     .kiwi: kiwiLabel]
        guard let label = labelDictionary[fruit] else { return nil }
        return label
    }
    
    func returnStepper(of fruit: Fruit) -> UIStepper? {
        let stepperDictionary: [Fruit: UIStepper] = [.strawberry: strawberryStepper,
                                                     .banana: bananaStepper,
                                                     .pineapple: pineappleStepper,
                                                     .mango: mangoStepper,
                                                     .kiwi: kiwiStepper]
        guard let stepper = stepperDictionary[fruit] else { return nil }
        return stepper
    }
    
    //MARK: - Stepper 초기 설정
    func settingStepper() {
        for fruit in Fruit.allCases {
            guard let fruitStepper = returnStepper(of: fruit) else { return }
            let stock = fruitStore.returnFruitStock(of: fruit)
            fruitStepper.value = Double(stock)
            fruitStepper.minimumValue = 0
            fruitStepper.autorepeat = true
        }
    }
    
   

    //MARK: - Stepper Action
    @IBAction func stepperPressed(_ sender: UIStepper) {
        for fruit in Fruit.allCases {
            let stock = Int(sender.value)
            guard sender == returnStepper(of: fruit),
                  let label = returnLabel(of: fruit) else { continue }

            label.text = stock.description
        }
    }
    
    
    
  
    
}
