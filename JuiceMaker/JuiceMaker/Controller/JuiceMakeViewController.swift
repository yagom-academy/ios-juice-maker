//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakeViewController: UIViewController, AlertDelegate {
    
    private var currentFruitBasket: [Fruit: Int] {
        return FruitStore.shared.fruitsBasket
    }
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpLabel()
    }
    
    private func setUpLabel() {
        strawberryLabel.text = currentFruitBasket[.strawberry]?.description
        bananaLabel.text = currentFruitBasket[.banana]?.description
        pineappleLabel.text = currentFruitBasket[.pineapple]?.description
        kiwiLabel.text = currentFruitBasket[.kiwi]?.description
        mangoLabel.text = currentFruitBasket[.mango]?.description
    }
    
    private func createButtonTarget(_ sender: UIButton) -> FruitJuice? {
        guard let titleLabel = sender.titleLabel?.text else {
            return nil
        }
        
        switch titleLabel {
        case "딸기쥬스 주문":
            return FruitJuice.strawberryJuice
        case "바나나쥬스 주문":
            return FruitJuice.bananaJuice
        case "파인애플쥬스 주문":
            return FruitJuice.pineappleJuice
        case "키위쥬스 주문":
            return FruitJuice.kiwiJuice
        case "망고쥬스 주문":
            return FruitJuice.mangoJuice
        case "딸바쥬스 주문":
            return FruitJuice.strawberryBananaJuice
        case "망키쥬스 주문":
            return FruitJuice.mangoKiwiJuice
        default:
            return nil
        }
    }
    
    private func showSuccessAlert(with targetJuice: FruitJuice) {
        let builder = AlertBuilder()
        let alertDirector = AlertDirector()
        alertDirector.buildSuccessAlert(builder, with: targetJuice)
        
        self.present(builder.buildAlert(), animated: true)
    }
    
    private func showFailureAlert(_ error: juiceMakeError) {
        let builder = AlertBuilder()
        builder.delegate = self
        let alertDirector = AlertDirector()
        
        error == juiceMakeError.outOfStockError ?
        alertDirector.buildOutOfStockAlert(builder) :
        alertDirector.buildUnknownAlert(builder)
        
        self.present(builder.buildAlert(), animated: true)
    }
    
    func presentFruitStoreVC() {
        guard let fruitStoreVC = self.storyboard?.instantiateViewController(withIdentifier: Identifier.fruitStoreNavigationController.rawValue) as? UINavigationController else {
            return
        }
        
        fruitStoreVC.modalPresentationStyle = .fullScreen
        self.present(fruitStoreVC, animated: true)
    }
    
    @IBAction func FruitStoreVCButtonTapped(_ sender: UIButton) {
        presentFruitStoreVC()
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let targetJuice = createButtonTarget(sender) else {
            return
        }
        do {
            try juiceMaker.make(targetJuice)
            setUpLabel()
            showSuccessAlert(with: targetJuice)
        } catch juiceMakeError.outOfStockError {
            showFailureAlert(juiceMakeError.outOfStockError)
        } catch {
            showFailureAlert(juiceMakeError.unknownError)
        }
    }
}
