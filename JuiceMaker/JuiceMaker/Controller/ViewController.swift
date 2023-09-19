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
    
    @objc func changeStock(_ noti: NSNotification) {
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
        guard let menu = Menu(rawValue: sender.tag)?.menuToKorean else {
            return
        }
        
        let grindCompleteAlert = UIAlertController(title: "\(menu) 나왔습니다", message: "맛있게드세요", preferredStyle: .alert)
        let grindCompleteAlertClose = UIAlertAction(title: "예", style: .cancel, handler: nil)
        grindCompleteAlert.addAction(grindCompleteAlertClose)
        
        let grindAlert = UIAlertController(title: "재료가 부족합니다", message: "재고를 수정할까요?", preferredStyle: .alert)
        let grindCancel = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        grindAlert.addAction(grindCancel)
        
        let grindConfirm = UIAlertAction(title: "네", style: .default) { action in
            self.goFruitStore(sender)
        }
        grindAlert.addAction(grindConfirm)

 
        do {
            switch sender.tag {
            case 1:
                try juiceMaker.takeOrder(order: .strawberryJuice)
            case 2:
                try juiceMaker.takeOrder(order: .bananaJuice)
            case 3:
                try juiceMaker.takeOrder(order: .pineappleJuice)
            case 4:
                try juiceMaker.takeOrder(order: .kiwiJuice)
            case 5:
                try juiceMaker.takeOrder(order: .mangoJuice)
            case 6:
                try juiceMaker.takeOrder(order: .strawberryBananaJuice)
            case 7:
                try juiceMaker.takeOrder(order: .mangoKiwiJuice)
            default:
                break
            }
            present(grindCompleteAlert, animated: true, completion: nil)
        } catch {
            present(grindAlert, animated: true, completion: nil)
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
        NotificationCenter.default.addObserver(self, selector: #selector(changeStock(_:)), name: Notification.Name("changeStock"), object: nil)
        NotificationCenter.default.post(name: Notification.Name("changeStock"), object: nil)
    }
}
