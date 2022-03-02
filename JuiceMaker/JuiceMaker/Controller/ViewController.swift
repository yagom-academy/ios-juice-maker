//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private var juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var stockOfStrawberryLabel: UILabel!
    @IBOutlet private weak var stockOfBananaLabel: UILabel!
    @IBOutlet private weak var stockOfPineappleLabel: UILabel!
    @IBOutlet private weak var stockOfKiwiLabel: UILabel!
    @IBOutlet private weak var stockOfMangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    @IBOutlet private weak var orderStrawberryBananaButton: UIButton!
    @IBOutlet private weak var orderMangoKiwiButton: UIButton!
    @IBOutlet private weak var orderStrawberryButton: UIButton!
    @IBOutlet private weak var orderBananaButton: UIButton!
    @IBOutlet private weak var orderPineappleButton: UIButton!
    @IBOutlet private weak var orderKiwiButton: UIButton!
    @IBOutlet private weak var orderMangoButton: UIButton!
    
    @IBAction private func orderJuiceAction(_ sender: UIButton) {
        guard let orderedJuiceType = JuiceMaker.JuiceType.init(rawValue: sender.currentTitle!.components(separatedBy: " ")[0]) else { return }
        do {
            let juice = try juiceMaker.makeJuice(juice: orderedJuiceType)
            showJuiceReadyAlert(juiceName: juice.name())
            updateFruitStockLabel(fruitType: juice.recipe().keys.map({ $0 }))
        } catch {
            showNotEnoughStockAlert()
        }
    }
    
    private func showNotEnoughStockAlert() {
        let alertBody = UIAlertController(title: MessageNameSpace.notEnoughStock, message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: MessageNameSpace.yes, style: .default, handler: {
            _ in self.switchScreenToManageStockView()
        })
        let noAction = UIAlertAction(title: MessageNameSpace.no, style: .cancel, handler: nil)
        alertBody.addAction(yesAction)
        alertBody.addAction(noAction)
        present(alertBody, animated: false, completion: nil)
    }
    
    private func showJuiceReadyAlert(juiceName: String) {
        let alertBody = UIAlertController(title: juiceName +  MessageNameSpace.juiceReady, message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: MessageNameSpace.confirm, style: .default, handler: nil)
        alertBody.addAction(confirmAction)
        present(alertBody, animated: false, completion: nil)
    }
    
    private func updateFruitStockLabel() {
        stockOfStrawberryLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.strawberry] ?? ConstantNameSpace.minimumNumberOfStock)
        stockOfBananaLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.banana] ?? ConstantNameSpace.minimumNumberOfStock)
        stockOfPineappleLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.pineapple] ?? ConstantNameSpace.minimumNumberOfStock)
        stockOfKiwiLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.kiwi] ?? ConstantNameSpace.minimumNumberOfStock)
        stockOfMangoLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.mango] ?? ConstantNameSpace.minimumNumberOfStock)
    }
    
    private func updateFruitStockLabel(fruitType: [FruitType]) {
        for fruit in fruitType {
            switch fruit {
            case FruitType.strawberry:
                stockOfStrawberryLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.strawberry] ?? ConstantNameSpace.minimumNumberOfStock)
            case FruitType.banana:
                stockOfBananaLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.banana] ?? ConstantNameSpace.minimumNumberOfStock)
            case FruitType.pineapple:
                stockOfPineappleLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.pineapple] ?? ConstantNameSpace.minimumNumberOfStock)
            case FruitType.kiwi:
                stockOfKiwiLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.kiwi] ?? ConstantNameSpace.minimumNumberOfStock)
            case FruitType.mango:
                stockOfMangoLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.mango] ?? ConstantNameSpace.minimumNumberOfStock)
            }
        }
    }
    
    @IBAction func modifyFruitStockAction(_ sender: Any) {
        switchScreenToManageStockView()
    }
    
    private func switchScreenToManageStockView() {
        guard let manageStockViewController = self.storyboard?.instantiateViewController(identifier: ViewNameSpace.ManageStockViewController) else { return }
        manageStockViewController.modalTransitionStyle = .coverVertical
        manageStockViewController.modalPresentationStyle = .automatic
        self.present(manageStockViewController, animated: true)
        }
}

