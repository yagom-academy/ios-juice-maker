//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit
import Foundation

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBAction func clickOrderButton(_ sender: UIButton) {
        guard let orderJuice: JuiceMenu = JuiceMenu.init(rawValue: sender.tag) else { return }
        juiceMaker.makeJuice(menu: orderJuice)
        updateFruitStock()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStock()
    }
    
    func updateFruitStock() {
        print(juiceMaker.updateFruitStore())
        
    }
}
