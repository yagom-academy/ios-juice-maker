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
    
    @IBAction func order(_ sender: UIButton) {
        guard let juice = Menu(rawValue: sender.tag) else {
            return
        }
        juiceMaker.make(menu: juice)
        updateStock()
    }
    
    func updateStock() {
        strawberryStock.text = juiceMaker.store.notifyStock(fruit: .strawberry).description
        bananaStock.text = juiceMaker.store.notifyStock(fruit: .banana).description
        pineappleStock.text = juiceMaker.store.notifyStock(fruit: .pineapple).description
        kiwiStock.text = juiceMaker.store.notifyStock(fruit: .kiwi).description
        mangoStock.text = juiceMaker.store.notifyStock(fruit: .mango).description
    }
}
