//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class HomeViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryAndBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoAndKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    var orderButton: [UIButton] {
       return [strawberryJuiceOrderButton, mangoAndKiwiJuiceOrderButton, strawberryAndBananaJuiceOrderButton, bananaJuiceOrderButton, pineappleJuiceOrderButton, kiwiJuiceOrderButton, mangoJuiceOrderButton]
    }
    
    var fruitLabel: [UILabel] {
        return [strawberryStockLabel, bananaStockLabel, pineappleStockLabel, kiwiStockLabel, mangoStockLabel]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderButton.forEach { orderButton in
            orderButton.addTarget(self, action: #selector(order), for: .touchUpInside)
        }
        
        updateFruitLabel()
    }
    
    @IBAction func tabEditStock(_ sender: UIBarButtonItem) {
        self.presentEditStockViewController()
    }
    
    @objc func order(_ sender: UIButton) {
        do {
            let juice = try convertToJuice(from: sender)
            try juiceMaker.make(menu: juice)
            showCompletionAlert(menu: juice)
        } catch JuiceMakerError.lackOfStock {
            showLackOfStockAlert()
        } catch {
            print(error)
        }
        updateFruitLabel()
    }
    
    func convertToJuice(from button: UIButton) throws -> Menu {
        switch button {
        case strawberryAndBananaJuiceOrderButton:
            return .strawberryAndBananaJuice
        case mangoAndKiwiJuiceOrderButton:
            return .mangoAndKiwiJuice
        case strawberryJuiceOrderButton:
            return .strawberryJuice
        case bananaJuiceOrderButton:
            return .bananaJuice
        case pineappleJuiceOrderButton:
            return .pineappleJuice
        case kiwiJuiceOrderButton:
            return .kiwiJuice
        case mangoJuiceOrderButton:
            return .mangoJuice
        default:
            throw JuiceMakerError.noneExistMenu
        }
    }
    
    func convertToFruit(from label: UILabel) -> Fruit {
        switch label {
        case strawberryStockLabel:
            return .strawberry
        case bananaStockLabel:
            return .banana
        case pineappleStockLabel:
            return .pineapple
        case kiwiStockLabel:
            return .kiwi
        case mangoStockLabel:
            return .mango
        default:
            return .strawberry
        }
    }
    
    func updateFruitLabel() {
        fruitLabel.forEach { fruitLabel in
            let fruit = convertToFruit(from: fruitLabel)
            
            fruitLabel.text = "\(juiceMaker.store.stock(fruit: fruit))"
        }
    }
    
    func showLackOfStockAlert() {
        let lackOfStockAlert = UIAlertController(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let noAlert = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        let okAlert = UIAlertAction(title: "예", style: .default) { _ in
            self.presentEditStockViewController()
        }
        
        lackOfStockAlert.addAction(noAlert)
        lackOfStockAlert.addAction(okAlert)
        
        present(lackOfStockAlert, animated: true)
    }
    
    func showCompletionAlert(menu: Menu) {
        let completionAlert = UIAlertController(title: "알림", message: "\(menu) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        completionAlert.addAction(okAlert)
        
        present(completionAlert, animated: true)
    }
    
    func presentEditStockViewController() {
        guard let editStockVC = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController")
        else {
            return
        }
        self.present(editStockVC, animated: true)
    }
}
