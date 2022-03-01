//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var stockOfStrawberryLabel: UILabel!
    @IBOutlet private weak var stockOfBananaLabel: UILabel!
    @IBOutlet private weak var stockOfPineappleLabel: UILabel!
    @IBOutlet private weak var stockOfKiwiLabel: UILabel!
    @IBOutlet private weak var stockOfMangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        let alertBody = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: {
            _ in self.switchScreenToManageStockView()
        })
        let noAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alertBody.addAction(yesAction)
        alertBody.addAction(noAction)
        present(alertBody, animated: false, completion: nil)
    }
    
    private func showJuiceReadyAlert(juiceName: String) {
        let alertBody = UIAlertController(title: "\(juiceName) 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertBody.addAction(confirmAction)
        present(alertBody, animated: false, completion: nil)
    }
    
    private func updateFruitStockLabel() {
        stockOfStrawberryLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.strawberry] ?? 0)
        stockOfBananaLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.banana] ?? 0)
        stockOfPineappleLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.pineapple] ?? 0)
        stockOfKiwiLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.kiwi] ?? 0)
        stockOfMangoLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.mango] ?? 0)
    }
    
    private func updateFruitStockLabel(fruitType: [FruitType]) {
        for fruit in fruitType {
            switch fruit {
            case FruitType.strawberry:
                stockOfStrawberryLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.strawberry] ?? 0)
            case FruitType.banana:
                stockOfBananaLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.banana] ?? 0)
            case FruitType.pineapple:
                stockOfPineappleLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.pineapple] ?? 0)
            case FruitType.kiwi:
                stockOfKiwiLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.kiwi] ?? 0)
            case FruitType.mango:
                stockOfMangoLabel.text = String(juiceMaker.fruitStore.fruits[FruitType.mango] ?? 0)
            }
        }
    }
    
    private func switchScreenToManageStockView() {
        guard let manageStockViewController = self.storyboard?.instantiateViewController(identifier: "ManageStockViewController") else { return }
        self.navigationController?.pushViewController(manageStockViewController, animated: true)
    }
    
    @IBAction private func modifyFruitStockAction(_ sender: Any) {
        switchScreenToManageStockView()
    }
}

