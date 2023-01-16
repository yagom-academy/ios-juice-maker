//
//  JuiceMaker - ViewController.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class OrderJuiceViewController: UIViewController {
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak private var ddalbaJuiceOrderButton: UIButton!
    @IBOutlet weak private var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak private var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak private var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak private var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak private var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak private var mangkiJuiceOrderButton: UIButton!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateStockLabel()
        setUpNotificationObserver()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = juiceMaker.currentFruitStock(of: .strawberry).description
        bananaStockLabel.text = juiceMaker.currentFruitStock(of: .banana).description
        pineappleStockLabel.text = juiceMaker.currentFruitStock(of: .pineapple).description
        kiwiStockLabel.text = juiceMaker.currentFruitStock(of: .kiwi).description
        mangoStockLabel.text = juiceMaker.currentFruitStock(of: .mango).description
    }
    
    private func setUpNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didDismissManageStockView(_:)), name: NSNotification.Name("dismiss"), object: nil)
    }
    
    @objc private func didDismissManageStockView(_ notification: Notification) {
        self.updateStockLabel()
    }
    
    private func takeOrders(_ sender: UIButton) -> JuiceMenu? {
        switch sender {
        case strawberryJuiceOrderButton:
            return JuiceMenu.strawberryJuice
        case ddalbaJuiceOrderButton:
            return JuiceMenu.strawberryBananaJuice
        case bananaJuiceOrderButton:
            return JuiceMenu.bananaJuice
        case pineappleJuiceOrderButton:
            return JuiceMenu.pineappleJuice
        case kiwiJuiceOrderButton:
            return JuiceMenu.kiwiJuice
        case mangoJuiceOrderButton:
            return JuiceMenu.mangoJuice
        case mangkiJuiceOrderButton:
            return JuiceMenu.mangoKiwiJuice
        default:
            return nil
        }
    }

    private func completeOrder(of orderedJuice: JuiceMenu) {
        do {
            try juiceMaker.makeJuice(orderedJuice)
            updateStockLabel()
            showSuccessAlert(name: orderedJuice.name)
        } catch JuiceMakerError.outOfStock {
            print(JuiceMakerError.outOfStock.message)
            showFailAlert()
        } catch JuiceMakerError.fruitError {
            print(JuiceMakerError.fruitError.message)
        } catch {
            print("알 수 없는 오류가 발생했습니다.")
        }
    }
 
    private func showSuccessAlert(name: String) {
        let alert = UIAlertController(title: "\(name) 나왔습니다! 맛있게 드세요!",message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    private func showFailAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: { action in
            self.performSegue(withIdentifier: "toManageVC", sender: nil)
        })
        let cancel = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction private func orderButtonTapped(_ sender: UIButton) {
        guard let orderedJuice = takeOrders(sender) else {
            return
        }
        completeOrder(of: orderedJuice)
    }
    
    @IBAction private func manageStockBarButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toManageVC", sender: self)
    }
}


