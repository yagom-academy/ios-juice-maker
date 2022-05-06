//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    @IBOutlet weak var strawberryInventoryLabel: UILabel!
    @IBOutlet weak var bananaInventoryLabel: UILabel!
    @IBOutlet weak var pineappleInventoryLabel: UILabel!
    @IBOutlet weak var kiwiInventoryLabel: UILabel!
    @IBOutlet weak var mangoInventoryLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsInventoryLabels()
    }
    
    func updateFruitsInventoryLabels() {
        let errorValue = 999
        strawberryInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? errorValue)
        bananaInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.banana] ?? errorValue)
        pineappleInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.pineapple] ?? errorValue)
        kiwiInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.kiwi] ?? errorValue)
        mangoInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.mango] ?? errorValue)
    }
    
    private func order(juice: JuiceMaker.Menu) {
        do {
            try JuiceMaker.shared.make(juice: juice)
            showSuccessAlert(message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!")
            updateFruitsInventoryLabels()
        } catch {
            showFailureAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "고마워요 😘", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailureAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] (action) in
            guard let storyboard = self?.storyboard?.instantiateViewController(identifier: "InventoryViewController") else {
                return
            }
            self?.present(storyboard, animated: true, completion: nil)
        }
        
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapJuiceOrderButton(_ sender: UIButton) {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            order(juice: .strawberryBananaJuice)
        case mangoKiwiJuiceOrderButton:
            order(juice: .mangoKiwiJuice)
        case strawberryJuiceOrderButton:
            order(juice: .strawberryJuice)
        case bananaJuiceOrderButton:
            order(juice: .bananaJuice)
        case pineappleJuiceOrderButton:
            order(juice: .pineappleJuice)
        case kiwiJuiceOrderButton:
            order(juice: .kiwiJuice)
        default:
            order(juice: .mangoJuice)
        }
    }
}

//extension UIButton {
//    enum JuiceName: String {
//        case strawberryJuice = "딸기쥬스"
//        case bananaJuice = "바나나쥬스"
//        case kiwiJuice = "키위쥬스"
//        case pineappleJuice = "파인애플쥬스"
//        case strawberryBananaJuice = "딸바쥬스"
//        case mangoJuice = "망고쥬스"
//        case mangoKiwiJuice = "망키쥬스"
//    }
//}
