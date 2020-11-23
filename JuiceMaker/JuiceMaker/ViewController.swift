//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    var menuOrder = [UIButton : JuiceMenu]()
    
    var strawberryCount : Int = 0 {
        didSet {
            strawberryCountLabel.text = "\(strawberryCount)"
        }
    }
    var bananaCount : Int = 0 {
        didSet {
            bananaCountLabel.text = "\(bananaCount)"
        }
    }
    var pineappleCount : Int = 0 {
        didSet {
            pineappleCountLabel.text = "\(pineappleCount)"
        }
    }
    var kiwiCount : Int = 0 {
        didSet {
            kiwiCountLabel.text = "\(kiwiCount)"
        }
    }
    var mangoCount : Int = 0 {
        didSet {
            mangoCountLabel.text = "\(mangoCount)"
        }
    }
     
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    @IBOutlet weak var ddalbaOrderButton: UIButton!
    @IBOutlet weak var mankiOrderButton: UIButton!
    @IBOutlet weak var strawberryOrderButton: UIButton!
    @IBOutlet weak var bananaOrderButton: UIButton!
    @IBOutlet weak var pineappleOrderButton: UIButton!
    @IBOutlet weak var kiwiOrderButton: UIButton!
    @IBOutlet weak var mangoOrderButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeStockLabel()
        initializeMenuOrder()
    }
    
    @IBAction func orderJuiceMenu(_ orderButton: UIButton) {
        guard let orderedMenu = menuOrder[orderButton] else {
            print("Error")
            return
        }
        
        guard juiceMaker.isAvailableMaking(juice: orderedMenu) else {
            showFailedToOrderAlert()
            return
        }
        
        juiceMaker.makeJuice(of: orderedMenu)
        
        let alertMessage = juiceMaker.makeSuccessMessage(of: orderedMenu)
        showSuccessAlert(of: alertMessage)
        
        updateStockStatusAfterMaking(juice: orderedMenu)

        return
    }
}
extension ViewController {
    private func initializeStockLabel() {
        strawberryCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.strawberry)
        bananaCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.banana)
        pineappleCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.pineapple)
        kiwiCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.kiwi)
        mangoCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.mango)
    }
    
    private func initializeMenuOrder() {
        menuOrder[ddalbaOrderButton] = .ddalbaJuice
        menuOrder[mankiOrderButton] = .mangoKiwiJuice
        menuOrder[strawberryOrderButton] = .strawberryJuice
        menuOrder[bananaOrderButton] = .bananaJuice
        menuOrder[pineappleOrderButton] = .pineappleJuice
        menuOrder[kiwiOrderButton] = .kiwiJuice
        menuOrder[mangoOrderButton] = .mangoJuice
    }

    private func updateStockStatusAfterMaking(juice order: JuiceMenu) {
        switch order {
        case .ddalbaJuice:
            strawberryCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.strawberry)
            bananaCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.banana)
        case .mangoKiwiJuice:
            mangoCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.mango)
            kiwiCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.kiwi)
        case .strawberryJuice:
            strawberryCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.strawberry)
        case .bananaJuice:
            bananaCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.banana)
        case .pineappleJuice:
            pineappleCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.pineapple)
        case .mangoJuice:
            mangoCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.mango)
        case .kiwiJuice:
            kiwiCount = juiceMaker.checkCurrentStockAmount(of: juiceMaker.kiwi)
        }
    }
    
    private func showSuccessAlert(of message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }
    
    private func showFailedToOrderAlert() {
        let failedMessage = "재료가 모자라요. 재고를 수정할까요?"
        let alert = UIAlertController(title: nil, message: failedMessage, preferredStyle: .alert)
        let notChangeStockAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        let changeStockAction = UIAlertAction(title: "네", style: .default) { action in
            self.presentModifyingStockView()
        }
        
        alert.addAction(notChangeStockAction)
        alert.addAction(changeStockAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    private func presentModifyingStockView() {
        guard let modifyingStockViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "modifyStockVC") else {
            return
        }
        
        self.present(modifyingStockViewController, animated: true, completion: nil)
    }
}

