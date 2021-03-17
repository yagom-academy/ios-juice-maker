//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/17.
//

import Foundation
import UIKit

extension StockViewController {
    @IBAction func touchUpStepper(_ sender: StockStepper) {
        sender.stockLabel!.text = String(Int(sender.value) + sender.stockLabel!.fruit.stock)
    }
    
    @IBAction func touchUpSaveButton(_ sender: UIButton) {
        let alert = UIAlertController(title: nil , message: "재고수정을 마치시겠습니까?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .cancel){
            action in
            self.saveChanges()
            let serialQueue = DispatchQueue(label: "serialQueue")
            serialQueue.sync {
                self.saveSuccessAlert()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
                serialQueue.sync {
                    let mainView = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
                    mainView?.modalTransitionStyle = .flipHorizontal
                    self.present(mainView!, animated: true, completion: nil)
                }
            }
        }
        let noAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeStockLabel()
        initializeStockStepper()
    }
    
    private func initializeStockLabel() {
        strawberryStock.fruit = FruitType.strawberry
        strawberryStock.text = String(FruitType.strawberry.stock)
        bananaStock.fruit = FruitType.banana
        bananaStock.text = String(FruitType.banana.stock)
        pineappleStock.fruit = FruitType.pineapple
        pineappleStock.text = String(FruitType.pineapple.stock)
        kiwiStock.fruit = FruitType.kiwi
        kiwiStock.text = String(FruitType.kiwi.stock)
        mangoStock.fruit = FruitType.mango
        mangoStock.text = String(FruitType.mango.stock)
    }
    
    private func initializeStockStepper() {
        strawBerryStockStepper.stockLabel = strawberryStock
        bananaStockStepper.stockLabel = bananaStock
        pineappleStockStepper.stockLabel = pineappleStock
        kiwiStockStepper.stockLabel = kiwiStock
        mangoStockStepper.stockLabel = mangoStock
    }
    
    func saveChanges() {
        strawberryStock.fruit.addStock(amount: Int(strawBerryStockStepper.value))
        bananaStock.fruit.addStock(amount: Int(bananaStockStepper.value))
        pineappleStock.fruit.addStock(amount: Int(pineappleStockStepper.value))
        kiwiStock.fruit.addStock(amount: Int(kiwiStockStepper.value))
        mangoStock.fruit.addStock(amount: Int(mangoStockStepper.value))
    }
    
    func saveSuccessAlert() {
        let alert = UIAlertController(title: nil, message: "재고 추가가 완료되었습니다!", preferredStyle: .alert)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.85) {
            alert.dismiss(animated: true, completion: nil)
        }
        present(alert, animated: true, completion: nil)
    }
}
