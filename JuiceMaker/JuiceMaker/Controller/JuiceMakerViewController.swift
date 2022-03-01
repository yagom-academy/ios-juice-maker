//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {   
    private var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJucieOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        do {
            let order = try takeOrder(sender: sender)
            try juiceMaker?.produce(juice: order)
            try configureStockLabels()
            alert(menu: order)
        } catch (let error) {
            alertError(error: error)
        }
    }
    @IBAction func touchUpTest(_ sender: Any) {
        presentModifyingStockViewController()
    }
    
    static func instance(juiceMaker: JuiceMaker) -> JuiceMakerViewController {
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyborad.instantiateViewController(withIdentifier: "JuiceMakerViewController") as! JuiceMakerViewController
        viewController.juiceMaker = juiceMaker
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateStockLabels), name: .updatedStockLabels, object: nil)
        NotificationCenter.default.post(name: .updatedStockLabels, object: nil)
    }
    
    @objc func updateStockLabels() {
        do {
            try configureStockLabels()
        } catch (let error) {
            alertError(error: error)
        }
    }
    
    private func configureStockLabels() throws {
        var amountLabels: [UILabel] = []
        let fruits = Fruit.allCases
        
        fruits
            .forEach { fruit in
                amountLabels.append(findStockLabel(of: fruit))
            }
        
        var currentIndex = amountLabels.startIndex
        
        for fruit in fruits {
            let currentLabel = amountLabels[currentIndex]
            
            guard let fruitAmount = juiceMaker?.fruitStore.stocks[fruit] else {
                throw JuiceMakerError.notFoundFruit
            }
            
            currentLabel.text = String(fruitAmount)
            currentIndex = amountLabels.index(after: currentIndex)
        }
    }

    private func findStockLabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryAmountLabel
        case .banana:
            return bananaAmountLabel
        case .pineapple:
            return pineappleAmountLabel
        case .kiwi:
            return kiwiAmountLabel
        case .mango:
            return mangoAmountLabel
        }
    }
    
    private func takeOrder(sender: UIButton) throws -> JuiceMaker.Menu {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            return .strawberryBanana
        case mangoKiwiJuiceOrderButton:
            return .mangoKiwi
        case strawberryJucieOrderButton:
            return .strawberry
        case bananaJuiceOrderButton:
            return .banana
        case pineappleJuiceOrderButton:
            return .pineapple
        case kiwiJuiceOrderButton:
            return .kiwi
        case mangoJuiceOrderButton:
            return .mango
        default:
            throw JuiceMakerError.notFoundMenu
        }
    }
    
    private func alert(menu: JuiceMaker.Menu) {
        let message = menu.rawValue + "쥬스 나왔습니다! 맛있게 드세요!"
        showAlert(title: message, confirmTitle: "확인")
    }
    
    private func alertError(error: Error) {
        let error = error as? JuiceMakerError
        showAlert(title: error?.errorDescription, confirmTitle: "확인", cancelTitle: "취소", confirmHandler: presentModifyingStockViewController)
    }
    
    private func presentModifyingStockViewController() {
        guard let modifyingStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyingStockViewController") else {
            return
        }
        
        modifyingStockViewController.modalTransitionStyle = .coverVertical
        self.present(modifyingStockViewController, animated: true)
    }
}

extension Notification.Name {
    static let updatedStockLabels = Notification.Name("updatedStockLabels")
}

extension UIViewController {
    func showAlert(title: String?,
                   confirmTitle: String?,
                   message: String? = nil,
                   cancelTitle: String? = nil,
                   confirmHandler: (() -> Void)? = nil,
                   cancelHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancelTitle = cancelTitle {
            let cancelButton = UIAlertAction(title: cancelTitle, style: .destructive, handler: { _ in cancelHandler?()
            })
            alert.addAction(cancelButton)
        }
        
        let confirmButton = UIAlertAction(title: confirmTitle, style: .default, handler: { _ in
            confirmHandler?()
        })
        
        alert.addAction(confirmButton)
        
        self.present(alert, animated: false)
    }
}

