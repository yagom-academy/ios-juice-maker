//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    let juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    @objc func refreshStock(_ noti: NSNotification) {
        if let strawberryStock = juiceMaker.fruitStore.fruitList[.strawberry] {
            strawberryCount.text = "\(strawberryStock)"
        }
        if let bananaStock = juiceMaker.fruitStore.fruitList[.banana] {
            bananaCount.text = "\(bananaStock)"
        }
        if let pineappleStock = juiceMaker.fruitStore.fruitList[.pineapple] {
            pineappleCount.text = "\(pineappleStock)"
        }
        if let kiwiStock = juiceMaker.fruitStore.fruitList[.kiwi] {
            kiwiCount.text = "\(kiwiStock)"
        }
        if let mangoStock = juiceMaker.fruitStore.fruitList[.mango] {
            mangoCount.text = "\(mangoStock)"
        }
    }
    
    func failureAlert() {
        let alert = UIAlertController(title: "재료가 부족합니다", message: "재고를 수정할까요?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "예", style: .default) { action in
            self.presentFruitStore()
        })
        alert.addAction(UIAlertAction(title: "아니요", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func completeAlert(menu: Menu) {
        let alert = UIAlertController(title: "\(menu.explainKorean) 나왔습니다", message: "맛있게드세요", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentFruitStore() {
        guard let FruitStoreViewController = storyboard?.instantiateViewController(identifier: String(describing: FruitStoreViewController.self)) else {
            return
        }
        FruitStoreViewController.modalPresentationStyle = .pageSheet
        FruitStoreViewController.modalTransitionStyle = .coverVertical
        present(FruitStoreViewController, animated: true)
    }
    
    
    @IBAction func touchUpInsideOrderButton(_ sender: UIButton) {
        guard let menu = Menu(rawValue: sender.tag) else {
            return
        }
        
        do {
            try juiceMaker.takeOrder(order: menu)
            completeAlert(menu: menu)
        } catch {
            failureAlert()
        }
    }
    
    @IBAction func touchUpInsidePresentFruitStore() {
        presentFruitStore()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshStock(_:)), name: Notification.Name("refreshStock"), object: nil)
        NotificationCenter.default.post(name: Notification.Name("refreshStock"), object: nil)
    }
}
