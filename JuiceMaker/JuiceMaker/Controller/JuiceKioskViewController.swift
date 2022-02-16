//
//  JuiceKioskViewController.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/16.
//

import UIKit

class JuiceKioskViewController: UIViewController {
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    var fruitsLabels: [Fruit: UILabel] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        patchData()
    }
    
    func patchData() {
        fruitsLabels = [.strawberry: strawberryCountLabel,
                       .banana: bananaCountLabel,
                       .pineapple: pineappleCountLabel,
                       .kiwi: kiwiCountLabel,
                       .mango: mangoCountLabel]
        
        for fruitLabel in fruitsLabels {
            guard let fruitCount = juiceMaker.fruitStore.stocks[fruitLabel.key] else {
                return
            }
            fruitLabel.value.text = "\(fruitCount)"
        }
    }
    
    @IBAction func modifyButtonTap(_ sender: Any) {
        let vc = ModifyStocksViewController.instantiate(with: "Main")
        navigationController?.pushViewController(vc, animated: true)
    }
}
