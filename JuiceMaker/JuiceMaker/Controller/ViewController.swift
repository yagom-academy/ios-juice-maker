//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
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
    
    @IBAction func orderButton(_ sender: UIButton) {
        guard let menu = Menu(rawValue: sender.tag) else {
            return
        }
        
        let completeAlert = UIAlertController(title: "\(menu.menuToKorean) 나왔습니다", message: "맛있게드세요", preferredStyle: .alert)
        let failureAlert = UIAlertController(title: "재료가 부족합니다", message: "재고를 수정할까요?", preferredStyle: .alert)
        
        completeAlert.addAction(UIAlertAction(title: "예", style: .default, handler: nil))
        failureAlert.addAction(UIAlertAction(title: "예", style: .default) { action in
            self.goFruitStore(sender)
        })
        failureAlert.addAction(UIAlertAction(title: "아니요", style: .default, handler: nil))
        
        do {
            try juiceMaker.takeOrder(order: menu)
            present(completeAlert, animated: true, completion: nil)
        } catch {
            present(failureAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func goFruitStore(_ sender: UIButton) {
        let JuiceMakerVC = storyboard?.instantiateViewController(identifier: "FruitStoreVC")
        JuiceMakerVC?.modalPresentationStyle = .pageSheet
        JuiceMakerVC?.modalTransitionStyle = .coverVertical
        present(JuiceMakerVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(refreshStock(_:)), name: Notification.Name("refreshStock"), object: nil)
        NotificationCenter.default.post(name: Notification.Name("refreshStock"), object: nil)
    }
}
