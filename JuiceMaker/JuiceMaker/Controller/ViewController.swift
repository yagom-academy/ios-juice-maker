//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }
    
    @IBAction func tabEditStock(_ sender: UIBarButtonItem) {
        self.changeView()
    }
    
    @IBAction func order(_ sender: UIButton) {
        guard let juice = Menu(rawValue: sender.tag) else {
            return
        }
        do {
            try juiceMaker.make(menu: juice)
        } catch {
            showlackOfStockAlert()
        }
        updateStock()
        showCompletionAlert(menu: juice)
    }
    
    func updateStock() {
        strawberryStock.text = juiceMaker.store.notifyStock(fruit: .strawberry).description
        bananaStock.text = juiceMaker.store.notifyStock(fruit: .banana).description
        pineappleStock.text = juiceMaker.store.notifyStock(fruit: .pineapple).description
        kiwiStock.text = juiceMaker.store.notifyStock(fruit: .kiwi).description
        mangoStock.text = juiceMaker.store.notifyStock(fruit: .mango).description
    }
    
    func showlackOfStockAlert() {
        let lackOfStockAlert = UIAlertController(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let noAlert = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        let okAlert = UIAlertAction(title: "예", style: .default) { _ in
            self.changeView()
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
    
    func changeView() {
        guard let stockVC = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController")
        else {
            return
        }
        self.present(stockVC, animated: true)
    }
}
