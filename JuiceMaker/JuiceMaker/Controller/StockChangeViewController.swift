//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by Kiseok, 쥬봉이 on 2023/09/15.
//

import UIKit

protocol StockChangeViewControllerDelegate: AnyObject {
    func updateLabel()
}

final class StockChangeViewController: UIViewController {
    
    @IBOutlet var labelCollection: [UILabel]! {
        didSet {
            labelCollection.sort { $0.tag < $1.tag }
        }
    }
    
    @IBOutlet var stepperCollection: [UIStepper]! {
        didSet {
            stepperCollection.sort { $0.tag < $1.tag }
        }
    }
    
    private let fruitStore: FruitStore = FruitStore.shared
    weak var delegate: StockChangeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStepperValue()
        setupUI()
    }
    
    private func setStepperValue() {
        Fruit.allCases.enumerated().forEach { (index, fruit) in
            stepperCollection[index].value = Double(fruitStore.fruits[fruit] ?? .zero)
        }
    }
    
    private func setupUI() {
        labelCollection.enumerated().forEach { (index, label) in
            label.text = String(changeStepperValueToInt(at: index))
        }
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        let index = sender.tag
        labelCollection[index].text = String(changeStepperValueToInt(at: index))
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        changeStock()
        self.delegate?.updateLabel()
        self.dismiss(animated: true)
    }
    
    private func changeStock() {
        Fruit.allCases.enumerated().forEach { (index, fruit) in
            let quantity = changeStepperValueToInt(at: index)
            fruitStore.changeStock(of: fruit, by: quantity)
        }
    }
    
    private func changeStepperValueToInt(at index: Int) -> Int {
        Int(stepperCollection[index].value)
    }
}
