//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared
    private let feedbackGenerator = UINotificationFeedbackGenerator()
    
    @IBOutlet private weak var strawberryAmountLabel: UILabel!
    @IBOutlet private weak var bananaAmountLabel: UILabel!
    @IBOutlet private weak var mangoAmountLabel: UILabel!
    @IBOutlet private weak var kiwiAmountLabel: UILabel!
    @IBOutlet private weak var pineappleAmountLabel: UILabel!
    
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    
    @IBAction private func juiceOrderButtonsHandler(_ button: UIButton) {
        switch button {
        case strawberryJuiceButton:
            orderJuice(.strawberryJuice)
        case bananaJuiceButton:
            orderJuice(.bananaJuice)
        case pineappleJuiceButton:
            orderJuice(.pineappleJuice)
        case kiwiJuiceButton:
            orderJuice(.kiwiJuice)
        case mangoJuiceButton:
            orderJuice(.mangoJuice)
        case strawberryBananaJuiceButton:
            orderJuice(.strawberryBananaJuice)
        case mangoKiwiJuiceButton:
            orderJuice(.mangoKiwiJuice)
        default:
            showAppTerminatingAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyAutoFontSizeToAllButtonLabels()
        notificationCenter.addObserver(self,
                                    selector: #selector(modalDismissCompletionHandler),
                                    name: .didEditAmount,
                                    object: nil)
        
        do {
            try updateAllFruitAmountLabels()
        } catch {
            showAppTerminatingAlert()
        }
    }
    
    @objc private func modalDismissCompletionHandler() {
        do {
            try updateAllFruitAmountLabels()
        } catch {
            showAppTerminatingAlert()
        }
    }
    
    private func updateAllFruitAmountLabels() throws {
        guard let strawberryAmount = fruitStore.inventory[.strawberry],
              let bananaAmount = fruitStore.inventory[.banana],
              let mangoAmount = fruitStore.inventory[.mango],
              let kiwiAmount = fruitStore.inventory[.kiwi],
              let pineappleAmount = fruitStore.inventory[.pineapple] else {
                  throw JuiceMakerError.fruitNotFound
              }
        
        strawberryAmountLabel.text = String(strawberryAmount)
        bananaAmountLabel.text = String(bananaAmount)
        mangoAmountLabel.text = String(mangoAmount)
        kiwiAmountLabel.text = String(kiwiAmount)
        pineappleAmountLabel.text = String(pineappleAmount)
    }
    
    private func orderJuice(_ juice: JuiceMaker.Juice) {
        do {
            try juiceMaker.make(juice)
            try updateAllFruitAmountLabels()
            showJuiceWasMadeAlert(juice: juice)
            feedbackGenerator.notificationOccurred(.success)
        } catch JuiceMakerError.notEnoughFruit {
            showNotEnoughFruitAlert()
            feedbackGenerator.notificationOccurred(.warning)
        } catch {
            showAppTerminatingAlert()
        }
    }
    
    private func showJuiceWasMadeAlert(juice: JuiceMaker.Juice) {
        let message = "\(juice.rawValue) 나왔습니다!\n맛있게 드세요!"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showNotEnoughFruitAlert() {
        let message = "재료가 모자라요.\n재고를 수정할까요?"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let navigateAction = UIAlertAction(title: "재고 수정하기", style: .default) {
            (action) in
            self.performSegue(withIdentifier: "SegueToEditAmountView", sender: nil)
        }

        alert.addAction(cancelAction)
        alert.addAction(navigateAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showAppTerminatingAlert() {
        let title = "시스템 오류가 발생했습니다."
        let message = "앱이 5초 뒤 종료됩니다...\n개발자에게 문의해주세요."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let terminateAction = UIAlertAction(title: "지금 종료", style: .destructive) { _ in
            exit(-1)
        }
        
        alert.addAction(terminateAction)
        present(alert, animated: true) {
            sleep(5)
            exit(-1)
        }
    }
    
    private func applyAutoFontSizeToAllButtonLabels() {
        strawberryJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        bananaJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        pineappleJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        kiwiJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        mangoJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        strawberryBananaJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        mangoKiwiJuiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}

