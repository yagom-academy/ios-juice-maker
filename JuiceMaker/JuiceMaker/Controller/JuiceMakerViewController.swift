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
    
    let juiceMaker = JuiceMaker()
    let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpEditStockButton(_ sender: UIBarButtonItem) {
        presentStockManager()
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        guard let juice = decideJuice(by: sender) else { return }
        
        do {
            try juiceMaker.makeJuice(for: juice)
        } catch {
            presentOrderFailureAlert()
        }
        presentOrderSuccessAlert(juice: juice, sender: sender)
        
        print(fruitStore.fruitStock)
    }
    
    func presentStockManager() {
        guard let stockManagerNC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerNavigationController") as? UINavigationController else { return }
                        
        self.present(stockManagerNC, animated: true)
    }
    
    func presentOrderSuccessAlert(juice: Juice, sender: UIButton) {
        let message = "\(juice.rawValue) 나왔습니다! 맛있게 드세요!"
               
        let alert = UIAlertController(title: "알림",
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentOrderFailureAlert() {
        let alert = UIAlertController(title: "알림",
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            self.presentStockManager()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func decideJuice(by sender: UIButton) -> Juice? {
        switch sender {
        case strawberryJuiceButton:
            return .strawberryJuice
        case bananaJuiceButton:
            return .bananaJuice
        case kiwiJuiceButton:
            return .kiwiJuice
        case pineappleJuiceButton:
            return .pineappleJuice
        case strawberryBananaJuiceButton:
            return .strawberryBananaJuice
        case mangoJuiceButton:
            return .mangoJuice
        case mangoKiwiJuiceButton:
            return .mangoKiwiJuice
        default:
            return nil
        }
    }
}
