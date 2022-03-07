//
//  JuiceMaker - ViewController.swift
//  Created by 원툴, 두두. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak private var strawberryBananaButton: UIButton!
    @IBOutlet weak private var strawberryButton: UIButton!
    @IBOutlet weak private var bananaButton: UIButton!
    @IBOutlet weak private var pineappleButton: UIButton!
    @IBOutlet weak private var mangoKiwiButton: UIButton!
    @IBOutlet weak private var kiwiButton: UIButton!
    @IBOutlet weak private var mangoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMultipleLabel()
    }
    
    private func updateMultipleLabel(of fruits: [Fruit] = Fruit.allCases) {
        fruits.forEach { fruit in
            updateLabel(of: fruit)
        }
    }
    
    private func updateLabel(of fruit: Fruit) {
        let fruitLabel = findLabel(of: fruit)
        let stock = juiceMaker.fruitStock
        
        guard let amount = stock[fruit] else {
            return
        }
        fruitLabel.text = "\(amount)"
    }
    
    @IBAction private func didTapStockEditButton(_ sender: UIBarButtonItem) {
        moveToStockViewController()
    }
    
    private func moveToStockViewController() {
        let stock = self.juiceMaker.fruitStock
        
        guard let stockViewController = self.storyboard?.instantiateViewController(identifier: "StockViewController", creator: { coder in
            return StockViewController(coder: coder, stock: stock)
        }) else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: stockViewController)
        self.present(navigationController, animated: true)
    }
    
    @IBAction private func order(_ sender: UIButton) {
        do {
            let juice = try findJuice(of: sender)
            try juiceMaker.make(fruitJuice: juice)
            
            let ingredients = juice.recipe.map{$0.key}
            updateMultipleLabel(of: ingredients)
            
            showOkAlert(title: "\(juice) " + AlertMessage.makeJuice)
        } catch JuiceMakerError.invalidButton {
            showOkAlert(title: AlertMessage.pushWrongButton)
        } catch JuiceMakerError.outOfStock {
            showStockErrorAlert(title: AlertMessage.outOfStock)
        } catch {
            showOkAlert(title: AlertMessage.unknownError)
        }
    }
    
    private func findLabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return strawberryStockLabel
        case .kiwi:
            return kiwiStockLabel
        case .banana:
            return bananaStockLabel
        case .pineapple:
            return pineappleStockLabel
        case .mango:
            return mangoStockLabel
        }
    }
    
    private func findJuice(of button: UIButton) throws -> Juice {
        switch button {
        case strawberryBananaButton:
            return .strawberryBananaJuice
        case strawberryButton:
            return .strawberryJuice
        case bananaButton:
            return .bananaJuice
        case pineappleButton:
            return .pineappleJuice
        case mangoKiwiButton:
            return .mangoKiwiJuice
        case kiwiButton:
            return .kiwiJuice
        case mangoButton:
            return .mangoJuice
        default:
            throw JuiceMakerError.invalidButton
        }
    }
}

extension JuiceMakerController {
    private func showStockErrorAlert(title: String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.yes, style: .default) { _ in
            self.moveToStockViewController()
        }
        
        let cancelAction = UIAlertAction(title: AlertMessage.no, style: .default)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func showOkAlert(title: String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertMessage.ok, style: .default)
        
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

enum AlertMessage{
    static let makeJuice = "나왔습니다! 맛있게 드세요!"
    static let pushWrongButton = "버튼을 잘못 누르셨습니다."
    static let unknownError = "알 수 없는 오류"
    static let outOfStock = "재료가 모자라요. 재고를 수정할까요?"
    static let yes = "예"
    static let no = "아니오"
    static let ok = "확인"
}
