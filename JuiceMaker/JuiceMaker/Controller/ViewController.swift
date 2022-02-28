//
//  JuiceMaker - ViewController.swift
//  Created by safari and Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var fruitStore = FruitStore.fruitStore
    var juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var magoLabel: UILabel!
    
    @IBAction func orderButton(_ sender: UIButton) {
        var juice: JuiceMaker.Juice
        switch sender.tag {
        case 0:
            juice = .strawberryJuice
        case 1:
            juice = .bananaJuice
        case 2:
            juice = .pineappleJuice
        case 3:
            juice = .kiwiJuice
        case 4:
            juice = .mangoJuice
        case 5:
            juice = .strawberryAndBananaJuice
        case 6:
            juice = .mangoAndKiwiJuice
        default:
            return
        }
        var message = juiceMaker.takeOrder(juice)
        updateFruitLable()
        showAlert(alertMessage: message)
    }
    
    func updateFruitLable() {
        strawberryLabel.text = String(fruitStore.getStock(of: .strawberry))
        bananaLabel.text = String(fruitStore.getStock(of: .banana))
        pineappleLabel.text = String(fruitStore.getStock(of: .pineapple))
        kiwiLabel.text = String(fruitStore.getStock(of: .kiwi))
        magoLabel.text = String(fruitStore.getStock(of: .mango))
    }
    
    func showAlert(alertMessage: String) {
        let alertCountroll = UIAlertController(title: "알림", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil )
        alertCountroll.addAction(okAction)
        present(alertCountroll, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLable()
       
        // Do any additional setup after loading the view.
    }
}
