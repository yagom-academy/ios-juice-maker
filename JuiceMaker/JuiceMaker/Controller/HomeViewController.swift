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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabel()
    }
    
    @IBAction func tabEditStock(_ sender: UIBarButtonItem) {
        self.presentEditStockViewController()
    }
    
    @IBAction func order(_ sender: UIButton) {
        guard let juice = Menu(rawValue: sender.tag) else {
            return
        }
        do {
            try juiceMaker.make(menu: juice)
        } catch {
            showLackOfStockAlert()
        }
        updateFruitLabel()
        showCompletionAlert(menu: juice)
    }
    
    func updateFruitLabel() {
        strawberryStockLabel.text = juiceMaker.store.stock(fruit: .strawberry).description
        bananaStockLabel.text = juiceMaker.store.stock(fruit: .banana).description
        pineappleStockLabel.text = juiceMaker.store.stock(fruit: .pineapple).description
        kiwiStockLabel.text = juiceMaker.store.stock(fruit: .kiwi).description
        mangoStockLabel.text = juiceMaker.store.stock(fruit: .mango).description
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
        let completionAlert = UIAlertController(title: "알림", message: "\(menu.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
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
