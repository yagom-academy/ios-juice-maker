//
//  ModifyViewController.swift
//  JuiceMaker
//
//  Created by Yongwoo Marco on 2021/06/08.
//

import UIKit

class ModifyViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var fruitStore = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateUILabels),
                    name: NSNotification.Name(rawValue: "updateUILabels"), object: nil)
        
        for fruit in Fruit.allCases {
            NotificationCenter.default.post(
                    name: NSNotification.Name(rawValue: "updateUILabels"), object: nil, userInfo: ["과일종류": fruit])
        }
    }
    
    @IBAction func closeModifyView(_ sender: Any) {
        dismiss(animated: false)
    }
}

extension ModifyViewController {
    @objc func updateUILabels(_ notification: Notification) {
        guard let userInfo = notification.userInfo else {
            print("userInfo 에러"); return
        }
        guard let infoValue = userInfo["과일종류"], let fruit = infoValue as? Fruit else {
            print("재고조회 에러 - userInfo"); return
        }
        switch fruit {
        case .strawberry:
            strawberryLabel.text = String(fruitStore.currentStock(.strawberry))
        case .banana:
            bananaLabel.text = String(fruitStore.currentStock(.banana))
        case .pineapple:
            pineappleLabel.text = String(fruitStore.currentStock(.pineapple))
        case .kiwi:
            kiwiLabel.text = String(fruitStore.currentStock(.kiwi))
        case .mango:
            mangoLabel.text = String(fruitStore.currentStock(.mango))
        }
    }
}
