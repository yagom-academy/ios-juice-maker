//
//  JuiceMaker - ViewController.swift
//  Created by 원툴, 두두. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerController: UIViewController {
    static let identifier = "StockViewController"
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
    
    @IBAction private func order(_ sender: UIButton) {
        do {
            let juice = try findJuice(of: sender)
            try juiceMaker.make(fruitJuice: juice)
            
            let ingredients = juice.recipe.map{$0.key}
            updateMultipleLabel(of: ingredients)
            showCompleteAlert(of: juice)
        } catch {
            showErrorAlert(of: error)
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
        
        guard let stockViewController = self.storyboard?.instantiateViewController(identifier: JuiceMakerController.identifier, creator: { coder in
            return StockViewController(coder: coder, stock: stock)
        }) else {
            return
        }
        stockViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: stockViewController)
        self.present(navigationController, animated: true)
    }
    
    private func showCompleteAlert(of juice: Juice) {
        let alertTitle = juice.name + " " + AlertMessage.makeJuice
        let okTitle = AlertMessage.ok
        
        showAlert(alertTitle: alertTitle, okTitle: okTitle)
    }
    
    private func showErrorAlert(of error: Error) {
        guard let juiceMakerError = error as? JuiceMakerError else {
            return
        }
        
        let alertTitle = juiceMakerError.localizedDescription
        
        switch juiceMakerError {
        case .outOfStock:
            let okTitle = AlertMessage.yes
            let okAction = moveToStockViewController
            let noTitle = AlertMessage.no
            
            showAlert(alertTitle: alertTitle, okTitle: okTitle, okAction: okAction, noTitle: noTitle)
        case .invalidButton:
            let okTitle = AlertMessage.ok
            
            showAlert(alertTitle: alertTitle, okTitle: okTitle)
        }
    }
    
    private func showAlert(alertTitle: String,
                   okTitle: String?,
                   okAction: (() -> ())? = nil,
                   noTitle: String? = nil,
                   noAction: (() -> ())? = nil) {
        
        let alertController = UIAlertController(title: alertTitle, message: nil, preferredStyle: .alert)
    
        if let okTitle = okTitle {
            let okAction = UIAlertAction(title: okTitle, style: .default) { _ in
                okAction?()
            }
            alertController.addAction(okAction)
        }
        
        if let noTitle = noTitle {
            let noAction = UIAlertAction(title: noTitle, style: .default) { _ in
                noAction?()
            }
            alertController.addAction(noAction)
        }
        
        present(alertController, animated: true)
    }
}

protocol UpdateDelegate: AnyObject {
    func update(data: [Fruit: Int])
}

extension JuiceMakerController: UpdateDelegate {
    func update(data: [Fruit : Int]) {
        let validData = data.filter{$0.value != 0}
        juiceMaker.changeStock(from: validData)
        
        let fruits = validData.map{$0.key}
        updateMultipleLabel(of: fruits)
    }
}

enum AlertMessage{
    static let makeJuice = "나왔습니다! 맛있게 드세요!"
    static let yes = "예"
    static let no = "아니오"
    static let ok = "확인"
}

