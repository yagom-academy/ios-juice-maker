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
        setStepper()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let fruitStock = makeFruitStockDictionary()
        fruitStore.updateFruitStock(fruitStock)
    }
    
    //MARK: - 화면 Label에 재고 Update
    private func updateStockLabel() {  
        fruitStore.fruits.forEach { fruit, stock in
             guard let label = findEachFruitLabel(of: fruit) else { return }
             label.text = "\(stock)"
         }
    }
    
    //MARK: - 과일에 맞는 label, stepper 반환
    func findEachFruitLabel(of fruit: Fruit) -> UILabel? {
        let labelDictionary: [Fruit: UILabel] = [.strawberry: strawberryLabel,
                                                 .banana: bananaLabel,
                                                 .pineapple: pineappleLabel,
                                                 .mango: mangoLabel,
                                                 .kiwi: kiwiLabel]
        guard let label = labelDictionary[fruit] else { return nil }
        return label
    }
    
    func findEachFruitStepper(of fruit: Fruit) -> UIStepper? {
        let stepperDictionary: [Fruit: UIStepper] = [.strawberry: strawberryStepper,
                                                     .banana: bananaStepper,
                                                     .pineapple: pineappleStepper,
                                                     .mango: mangoStepper,
                                                     .kiwi: kiwiStepper]
        guard let stepper = stepperDictionary[fruit] else { return nil }
        return stepper
    }
    
    //MARK: - Stepper 초기 설정
    func setStepper() {
        fruitStore.fruits.forEach { fruit, amount in
            guard let fruitStepper = findEachFruitStepper(of: fruit) else { return }
            
            fruitStepper.value = Double(amount)
            fruitStepper.minimumValue = 0
            fruitStepper.autorepeat = true
        }
    }

    //MARK: - Stepper Action
    @IBAction func stepperPressed(_ sender: UIStepper) {
        for fruit in Fruit.allCases {
            let stock = Int(sender.value)
            guard sender == findEachFruitStepper(of: fruit),
                  let label = findEachFruitLabel(of: fruit) else { continue }

            label.text = stock.description
        }
    }
    
    func makeFruitStockDictionary() -> [Fruit: Int] {
        let fruitStock: [Fruit: Int] = [.strawberry: Int(strawberryStepper.value),
                                        .banana: Int(bananaStepper.value),
                                        .pineapple: Int(pineappleStepper.value),
                                        .mango: Int(mangoStepper.value),
                                        .kiwi: Int(kiwiStepper.value)]
        
        return fruitStock
    }
    
    //MARK: - 네비게이터 버튼
    @IBAction func dismissButtonDidTapped(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
}
