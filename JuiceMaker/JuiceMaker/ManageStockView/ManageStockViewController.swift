//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/20.
//

import UIKit

class ManageStockViewController: UIViewController {
    
    @IBOutlet weak var fruitStockStackView: UIStackView!
    
    private var fruitStockViews: [FruitStockView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setFruitStockStack()
    }
    
    private func setupNavigation() {
        self.navigationItem.title = "재고 추가"
        
        let dissmissButton = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(onClickDismiss))
        self.navigationItem.rightBarButtonItem = dissmissButton
    }
    
    @objc func onClickDismiss() {
        let alert = UIAlertController(title: nil, message: "재고를 수정할까요?", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            do {
                try self.setStock()
            } catch {
                if let juiceError = error as? JuiceMakerError {
                    self.errorAlert(juiceError)
                }
            }
        }
        alert.addAction(cancleAction)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    // TODO: add Error Handler
    private func setStock() throws {
        for fruitStockView in fruitStockViews {
            guard let newStock = fruitStockView.fruitStock,
                  let fruit = fruitStockView.fruit else {
                throw JuiceMakerError.system
            }
            
            try JuiceMaker.shared.setStock(fruitType: fruit, stock: newStock)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setFruitStockStack() {
        let fruits: [FruitsType : Fruit] = JuiceMaker.shared.getFruits()
        
        for (key: fruitName, value: fruit) in fruits {
            let fruitStockView = FruitStockView(fruit: fruit.fruitType)
            fruitStockView.translatesAutoresizingMaskIntoConstraints = false
            fruitStockStackView.addArrangedSubview(fruitStockView)
            fruitStockView.widthAnchor.constraint(equalTo: fruitStockView.heightAnchor, multiplier: 0.74).isActive = true
            fruitStockView.fruitView.fruitName.text = fruitName.rawValue
            fruitStockView.fruitStock = fruit.stock
            fruitStockView.stockStepper.value = Double(fruit.stock)
            fruitStockView.stockStepper.minimumValue = Double(fruit.stock)
            
            fruitStockViews.append(fruitStockView)
        }
    }
    
    private func errorAlert(_ error: JuiceMakerError) {
        
    }
}
