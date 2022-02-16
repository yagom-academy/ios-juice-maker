//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    @IBAction func tapOrderButton(_ sender: UIButton) {
        Juice.allCases.forEach { juice in
            
            let order = sender.titleLabel?.text ?? ""
            checkMatch(order: order, juice: juice)
        }
    }
    
    func checkMatch(order: String, juice: Juice) {
        if order == juice.name + " 주문" {
            orderMenu(of: juice)
        }
    }
    
    func orderMenu(of juice: Juice) {
        let result = juiceMaker.make(of: juice)
         
         switch result {
         case .success(let data):
             print(data)
             configureView()
         case .failure(let data):
             print(data)
         }
    }
}

extension ViewController {
    func configureView() {
        strawberryLabel.text = String(juiceMaker.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.quantity(of: .mango))
    }
}
