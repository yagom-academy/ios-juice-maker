//
//  EditStockViewController.swift
//  JuiceMaker
//
//  Created by stone, jpush.
//

import UIKit

class EditStockViewController: UIViewController {
    let fruitStore = FruitStore.shared
    var stock: [Fruit : Int] = [:]
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(stock)
        setStockLabel()
        
//        Notification.default.addObserver(<#T##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
    }
    
    func setStockLabel() {
        self.strawberryStockLabel.text = "\(stock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(stock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(stock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(stock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(stock[.mango] ?? 0)"
    }
    
    @IBAction func changeFruitStock(_ sender: UIStepper) {
        switch sender {
        case strawberryStepper:
            print("딸기")
        default:
            break
            
        }
    }
    
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// 1. view controller 에서 fruitsStore.fruitsStock 데이터를 전달받는 방법
// 2. editStockViewController 에서 fruitsStore 싱글턴 객체를 선언한 후 viewdidLoad에서 데이터를 가져오는 방법

// 차이점
//
