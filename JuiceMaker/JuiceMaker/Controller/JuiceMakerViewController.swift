//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changeStockLabel()
    }

    func changeStockLabel() {
        strawberryStockLabel.text =  FruitStore.shared.showStock(of: .strawberry)
        bananaStockLabel.text =  FruitStore.shared.showStock(of: .banana)
        pineappleStockLabel.text =  FruitStore.shared.showStock(of: .pineapple)
        kiwiStockLabel.text =  FruitStore.shared.showStock(of: .kiwi)
        mangoStockLabel.text =  FruitStore.shared.showStock(of: .mango)
    }
    
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        let order = sender.currentTitle?.components(separatedBy: " ").first ?? ""
        
        let juice = Juice(rawValue: order)
        do {
            try juiceMaker.make(juice: juice)
            changeStockLabel()
            showMadeJuiceAlert(juice: order)
        } catch FruitStoreError.outOfStock(let neededFruit) {
            showFailedAlert(fruitAndQuantity: neededFruit)
        } catch {
            print(error)
        }
    }
    
    @IBAction func tapStockModifyButton(_ sender: UIBarButtonItem) {
        presentStockModifyView()
    }
    
    func presentStockModifyView() {
        let stockModifyNavController = StockModifyNavController()
        
        let storyboard = UIStoryboard(name: stockModifyNavController.storyboardName, bundle: nil)
        let stockModifyNC = storyboard.instantiateViewController(identifier: stockModifyNavController.storyboardID)
        
        present(stockModifyNC, animated: true, completion: nil)
    }
    
    func showMadeJuiceAlert(juice: String) {
        let alert = UIAlertController(title: "쥬스 완성", message: "\(juice) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let close = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailedAlert(fruitAndQuantity: [Fruit: Int]) {
        let alert = UIAlertController(title: "재고 부족", message: "\(DataFormatConverter().convert(using: fruitAndQuantity))가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "재고 수정하기", style: .default)
        let close = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(ok)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}

