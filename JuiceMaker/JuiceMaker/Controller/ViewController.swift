//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var juiceMaker = JuiceMaker()
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineapple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFruitStockLabel()
    }

    @IBOutlet weak var orderStrawberryBananaButton: UIButton!
    @IBOutlet weak var orderMangoKiwiButton: UIButton!
    @IBOutlet weak var orderStrawberryButton: UIButton!
    @IBOutlet weak var orderBananaButton: UIButton!
    @IBOutlet weak var orderPineappleButton: UIButton!
    @IBOutlet weak var orderKiwiButton: UIButton!
    @IBOutlet weak var orderMangoButton: UIButton!
    
    @IBAction func orderJuiceAction(_ sender: UIButton) {
        let juiceName: String = sender.currentTitle!.components(separatedBy: " ")[0]
        do {
            let juice = try juiceMaker.makeJuice(juice: JuiceMaker.JuiceType.init(rawValue: juiceName)!)
            showJuiceAlert(juiceName: juice.name())
            updateFruitStockLabel(fruitType: juice.recipe().keys.map({ $0 }))
        } catch {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: "", preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: {
            _ in self.changeFruitStock((Any).self)
            
        })
        let noAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: false, completion: nil)
    }
    
    func showJuiceAlert(juiceName: String) {
        let alert = UIAlertController(title: "\(juiceName) 나왔습니다. 맛있게 드세요.", message: "", preferredStyle: UIAlertController.Style.alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        present(alert, animated: false, completion: nil)
    }
    
    func updateFruitStockLabel() {
        stockOfStrawberry.text = String(juiceMaker.fruitStore.fruits[FruitType.strawberry] ?? 0)
        stockOfBanana.text = String(juiceMaker.fruitStore.fruits[FruitType.banana] ?? 0)
        stockOfPineapple.text = String(juiceMaker.fruitStore.fruits[FruitType.pineapple] ?? 0)
        stockOfKiwi.text = String(juiceMaker.fruitStore.fruits[FruitType.kiwi] ?? 0)
        stockOfMango.text = String(juiceMaker.fruitStore.fruits[FruitType.mango] ?? 0)
    }
    
    func updateFruitStockLabel(fruitType: [FruitType]) {
        for fruit in fruitType {
            switch fruit {
            case FruitType.strawberry:
                stockOfStrawberry.text = String(juiceMaker.fruitStore.fruits[FruitType.strawberry] ?? 0)
            case FruitType.banana:
                stockOfBanana.text = String(juiceMaker.fruitStore.fruits[FruitType.banana] ?? 0)
            case FruitType.pineapple:
                stockOfPineapple.text = String(juiceMaker.fruitStore.fruits[FruitType.pineapple] ?? 0)
            case FruitType.kiwi:
                stockOfKiwi.text = String(juiceMaker.fruitStore.fruits[FruitType.kiwi] ?? 0)
            case FruitType.mango:
                stockOfMango.text = String(juiceMaker.fruitStore.fruits[FruitType.mango] ?? 0)
            }
        }
    }

    @IBAction func changeFruitStock(_ sender: Any) {
        guard let stock = self.storyboard?.instantiateViewController(identifier: "PushViewController") else{
                    return
                }
                self.navigationController?.pushViewController(stock, animated: true)
    }
    
}

