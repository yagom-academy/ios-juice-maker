//
//  JuiceMaker - HomeViewController.swift
//  Created by Mene, Dragon.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class HomeViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak private var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak private var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak private var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak private var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak private var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak private var kiwiJuiceJuiceOrderButton: UIButton!
    @IBOutlet weak private var mangoJuiceOrderButton: UIButton!
    
    @IBAction private func orderFruitJuice(_ sender: UIButton) {
        guard let juice = takeJuiceMenu(of: sender) else { return }
        
        if juiceMaker.makeJuice(of: juice) {
            showSuccessAlert(of: juice)
            checkInventory()
        } else {
            showFailAlert()
        }
    }
    
    func takeJuiceMenu(of sender: UIButton) -> Juice? {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            return .strawBerryBanana
        case mangoKiwiJuiceOrderButton:
            return .mangoKiwi
        case strawberryJuiceOrderButton:
            return .strawBerry
        case bananaJuiceOrderButton:
            return .banana
        case pineappleJuiceOrderButton:
            return .pineApple
        case kiwiJuiceJuiceOrderButton:
            return .kiwi
        case mangoJuiceOrderButton:
            return .mango
        default:
            return nil
        }
    }
    
    private func showSuccessAlert(of juice: Juice) {
        let alert = UIAlertController(title: "제조 완료",
                                      message: "\(juice.rawValue)쥬스 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인",
                               style: .default,
                               handler: nil)
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    private func showFailAlert() {
        let alert = UIAlertController(title: "재고 부족",
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "재고수정",
                               style: .default,
                               handler: {_ in
            self.presentChangeInventoryViewController()
        })
        let cancel = UIAlertAction(title: "취소",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    private func presentChangeInventoryViewController() {
        guard let changeInventoryVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeInventoryViewController") as? ChangeInventoryViewController else { return }
        
        self.present(changeInventoryVC, animated: true)
    }
    
    private func checkInventory() {
        strawberryStockLabel.text = juiceMaker.checkStock(of: .strawBerry)
        bananaStockLabel.text = juiceMaker.checkStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.checkStock(of: .pineApple)
        kiwiStockLabel.text = juiceMaker.checkStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.checkStock(of: .mango)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInventory()
    }
    
}
