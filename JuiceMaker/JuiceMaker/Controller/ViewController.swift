//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared
    private var feedbackGenerator = UINotificationFeedbackGenerator()
    
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
            fatalError("Undefined Button")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try updateFruitAmountLabels()
        } catch JuiceMakerError.fruitNotFound {
            fatalError("Fruit Not Found")
        } catch {
            fatalError("Undefined Error")
        }
    }
    
    private func updateFruitAmountLabels() throws {
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
            try updateFruitAmountLabels()
            showJuiceWasMadeAlert(juice: juice)
            feedbackGenerator.notificationOccurred(.success)
        } catch JuiceMakerError.notEnoughFruit {
            showNotEnoughFruitAlert()
            feedbackGenerator.notificationOccurred(.warning)
        } catch JuiceMakerError.fruitNotFound {
            fatalError("Fruit Not Found")
        } catch {
            fatalError("Undefined Error")
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
}

