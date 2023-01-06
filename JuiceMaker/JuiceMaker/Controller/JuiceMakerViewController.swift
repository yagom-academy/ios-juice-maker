//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpEditStockButton(_ sender: UIBarButtonItem) {
        presentStockManager()
    }
    
    func presentStockManager() {
        guard let stockManagerNC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerNavigationController") as? UINavigationController else { return }
                        
        self.present(stockManagerNC, animated: true)
    }
    
    func presentOrderSuccessAlert(sender: UIButton) {
        var juice: Juice
        var message = " 나왔습니다!"

        switch sender {
        case strawberryJuiceButton:
            juice = .strawberryJuice
            message = juice.rawValue + message
        case bananaJuiceButton:
            juice = .bananaJuice
            message = juice.rawValue + message
        case kiwiJuiceButton:
            juice = .kiwiJuice
            message = juice.rawValue + message
        case pineappleJuiceButton:
            juice = .pineappleJuice
            message = juice.rawValue + message
        case strawberryBananaJuiceButton:
            juice = .strawberryBananaJuice
            message = juice.rawValue + message
        case mangoJuiceButton:
            juice = .mangoJuice
            message = juice.rawValue + message
        case mangoKiwiJuiceButton:
            juice = .mangoKiwiJuice
            message = juice.rawValue + message
        default:
            break
        }
                    
        let alert = UIAlertController(title: "알림",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        
        presentOrderSuccessAlert(sender: sender)
    }
}

