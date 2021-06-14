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
    
    var store = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateUILabels),
                    name: NSNotification.Name(rawValue: "updateUILabels"), object: nil)
        
        updateUILabels(Notification(name: NSNotification.Name(rawValue: "updateUILabels"), object: nil))
    }
    
    @IBAction func closeModifyView(_ sender: Any) {
        dismiss(animated: false)
    }
}

extension ModifyViewController {
    @objc func updateUILabels(_ notification: Notification) {
        if let info = notification.userInfo {
            guard let infoValue = info["과일종류"], let fruit = infoValue as? Fruit else { print("재고조회 에러 - userInfo"); return }
            switch fruit {
            case .strawberry:
                strawberryLabel.text = String(store.currentStock(.strawberry))
            case .banana:
                bananaLabel.text = String(store.currentStock(.banana))
            case .pineapple:
                pineappleLabel.text = String(store.currentStock(.pineapple))
            case .kiwi:
                kiwiLabel.text = String(store.currentStock(.kiwi))
            case .mango:
                mangoLabel.text = String(store.currentStock(.mango))
            }
        } else {
            strawberryLabel.text = String(store.currentStock(.strawberry))
            bananaLabel.text = String(store.currentStock(.banana))
            pineappleLabel.text = String(store.currentStock(.pineapple))
            kiwiLabel.text = String(store.currentStock(.kiwi))
            mangoLabel.text = String(store.currentStock(.mango))
        }
    }
}
