//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
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
            showSuccessOrder(of: order)
        } catch (let error) {
            showFailedOrder(with: error)
        }
    }
    
    @IBAction func touchUpModifyingStockButton(_ sender: Any) {
        presentModifyingStockViewController()
        }
    
    static func instance(juiceMaker: JuiceMaker) -> JuiceMakerViewController {
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyborad.instantiateViewController(withIdentifier: "JuiceMakerViewController") as? JuiceMakerViewController else {
            return JuiceMakerViewController()
        }
        viewController.juiceMaker = juiceMaker
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribe()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unSubscribe()
    }

    private func configureStockLabels() throws {
        var amountLabels: [UILabel] = []
        let fruits = Fruit.allCases
        
        fruits
            .forEach { fruit in
                amountLabels.append(findStockLabel(of: fruit))
            }
        
        try match(amountLabels: amountLabels, with: fruits)
    }
    
    private func match(amountLabels: [UILabel], with fruits: [Fruit]) throws {
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
    
    private func showSuccessOrder(of menu: JuiceMaker.Menu) {
        let message = menu.rawValue + "쥬스 나왔습니다! 맛있게 드세요!"

        AlertBuilder(viewController: self)
            .setTitle(message)
            .setConfirmTitle("확인")
            .showAlert()
    }
    
    private func showFailedOrder(with error: Error) {
        guard let error = error as? JuiceMakerError,
              let errorDescription = error.errorDescription else {
                  return
              }

        AlertBuilder(viewController: self)
            .setTitle(errorDescription)
            .setConfirmTitle("확인")
            .setCancelTitle("취소")
            .setConfirmHandler(presentModifyingStockViewController)
            .showAlert()
    }
    
    private func presentModifyingStockViewController() {
        guard let modifyingStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyingStockViewController") else {
            return
        }
        
        self.present(modifyingStockViewController, animated: true)
    }
}

extension JuiceMakerViewController: Observer {
    private func subscribe() {
        juiceMaker?.fruitStore.subscribe(observer: self)
    }
    
    private func unSubscribe() {
        juiceMaker?.fruitStore.unSubscribe(observer: self)
    }
    
    func updateStockLabels() {
        do {
            try configureStockLabels()
        } catch (let error) {
            showFailedOrder(with: error)
        }
    }
}
