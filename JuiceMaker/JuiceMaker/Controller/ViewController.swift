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

    @IBAction func tapOrderButton(_ sender: UIButton) {
        Juice.allCases.forEach { juice in
            
            let order = sender.titleLabel?.text ?? ""
            checkMatch(order: order, juice: juice)
        }
    }
    
    private func checkMatch(order: String, juice: Juice) {
        if order == juice.name + " 주문" {
            orderMenu(of: juice)
        }
    }
    
    private func orderMenu(of juice: Juice) {
        let result = juiceMaker.make(of: juice)
         
         switch result {
         case .success(let message):
             configureView()
             showConfirmAlert(for: message)
         case .failure:
             showNotEnoghAlert()
         }
    }
    
    private func showConfirmAlert(for message: String) {
        let alert = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }
    
    private func showNotEnoghAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: "", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        let cancleAction =  UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel)
        alert.addAction(defaultAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension ViewController {
    private func configureView() {
        strawberryLabel.text = String(juiceMaker.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.quantity(of: .mango))
    }
}
