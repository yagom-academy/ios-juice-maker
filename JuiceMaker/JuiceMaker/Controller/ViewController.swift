//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateInventory()
    }
    
    func updateInventory() {
        strawberryCount.text = String(juiceMaker.store.fruitsInventory[.strawberry]!)
        bananaCount.text = String(juiceMaker.store.fruitsInventory[.banana]!)
        pineappleCount.text = String(juiceMaker.store.fruitsInventory[.pineapple]!)
        kiwiCount.text = String(juiceMaker.store.fruitsInventory[.kiwi]!)
        mangoCount.text = String(juiceMaker.store.fruitsInventory[.mango]!)
    }
    
    
    func order(juice: JuiceMaker.Menu) {
        do {
            try juiceMaker.make(juice: juice)
            showSuccessAlert(message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!")
        } catch {
            showFailureAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
        updateInventory()
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "고마워요 😘", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailureAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) {
            (action) in 
            let storyboard = self.storyboard!.instantiateViewController(identifier: "InventoryViewController")
            self.present(storyboard, animated: true, completion: nil)
        }
        
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func juiceOrderButtonTapped(_ sender: UIButton) {
        let selected = sender.currentTitle
        
        switch selected {
        case "딸바쥬스 주문":
            order(juice: .strawberryBananaJuice)
        case "망키쥬스 주문":
            order(juice: .mangoKiwiJuice)
        case "딸기쥬스 주문":
            order(juice: .strawberryJuice)
        case "바나나쥬스 주문":
            order(juice: .bananaJuice)
        case "파인애플쥬스 주문":
            order(juice: .pineappleJuice)
        case "키위쥬스 주문":
            order(juice: .kiwiJuice)
        default:
            order(juice: .mangoJuice)
        }
    }
}

