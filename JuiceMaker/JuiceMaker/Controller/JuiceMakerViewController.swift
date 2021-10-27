//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet var currentStrawberryStockLabel: UILabel!
    @IBOutlet var currentBanannaStockLabel: UILabel!
    @IBOutlet var currentPineappleStockLabel: UILabel!
    @IBOutlet var currentKiwiStockLabel: UILabel!
    @IBOutlet var currentMangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        
        let fruitStore = FruitStore(fruitList: Fruit.allCases, amount: 10)
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        // Do any additional setup after loading the view.
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(increaseStock),
                                               name: Notification.Name.increaseStock,
                                               object: nil)
    }
    
    func order(juice: JuiceMenu) {
        do {
            try juiceMaker?.make(juice)
        } catch FruitStoreError.deficientStock {
            print("재고가 부족해요 재고를 수정해주세요")
            return
        } catch {
            print("알 수 없는 에러ㅜ")
            return
        }
        print("쥬스 나갔습니다~")
    }
    
    @objc
    private func increaseStock(notification: Notification) {
        guard let fruit = notification.userInfo?.keys.first as? Fruit else {
            return
        }
        
        
        if let changedAmount = notification.userInfo?[fruit] as? Int {
            switch fruit {
            case .strawberry:
                self.currentStrawberryStockLabel.text = "\(changedAmount)"
            case .bananna:
                self.currentBanannaStockLabel.text = "\(changedAmount)"
            case .pineapple:
                self.currentPineappleStockLabel.text = "\(changedAmount)"
            case .kiwi:
                self.currentKiwiStockLabel.text = "\(changedAmount)"
            case .mango:
                self.currentMangoStockLabel.text = "\(changedAmount)"
            }
        }
    }
    
    @IBAction func navigateToStockModificationVC(_ sender: UIBarButtonItem) {
        let stockManagerVC = storyboard?.instantiateViewController(withIdentifier: "StockManagerVC") as! StockManagerViewController
        let navigationController = UINavigationController(rootViewController: stockManagerVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func orderStrawberryBanannaJuice(_ sender: UIButton) {
        order(juice: .strawberryBanannaJuice)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        order(juice: .strawberryJuice)
    }
    
    @IBAction func orderBanannaJuice(_ sender: UIButton) {
        order(juice: .banannaJuice)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        order(juice: .mangoKiwiJuice)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        order(juice: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        order(juice: .kiwiJuice)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        order(juice: .mangoJuice)
    }
}

extension Notification.Name {
    static let increaseStock = Notification.Name(rawValue: "increaseStock")
}
