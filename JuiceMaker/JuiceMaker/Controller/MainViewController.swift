//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var strawberryStock: UILabel!
    @IBOutlet private weak var bananaStock: UILabel!
    @IBOutlet private weak var pineappleStock: UILabel!
    @IBOutlet private weak var kiwiStock: UILabel!
    @IBOutlet private weak var mangoStock: UILabel!
    
    @IBOutlet private weak var strawberryOrderButton: UIButton!
    @IBOutlet private weak var bananaOrderButton: UIButton!
    @IBOutlet private weak var pineappleOrderButton: UIButton!
    @IBOutlet private weak var kiwiOrderButton: UIButton!
    @IBOutlet private weak var mangoOrderButton: UIButton!
    @IBOutlet private weak var strawberryBananaOrderButton: UIButton!
    @IBOutlet private weak var mangoKiwiOrderButton: UIButton!
    
    private var fruiteStore: FruitStore = {
        return FruitStore(
            strawberryCount: 18,
            bananaCount: 10,
            kiwiCount: 10,
            pineappleCount: 10,
            mangoCount: 10
        )
    }()
    
    private lazy var singleJuiceMaker: SingleFruitJuiceMaker = {
        SingleFruitJuiceMaker(fruitStore: fruiteStore)
    }()
    
    private lazy var mixedFruitJuiceMaker: MixedFruitJuiceMaker = {
        MixedFruitJuiceMaker(fruitStore: fruiteStore)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCount()
        addTargetButton()
    }
    
    @IBAction func touchUpStockManagementButon(_ sender: UIBarButtonItem) {
        showModalStockManagementView()
    }
}

extension MainViewController {
    @objc private func order(_ sender: UIButton) {
        do {
            let message = try getJuiceMaker(uiButton: sender).order()
            setCount()
            showBasicAlert(message: message ?? "")
        } catch {
            catchOrderError(error: error)
        }
    }
    
    private func catchOrderError(error: Error) {
        if let error = error as? JuiceMakerStateError,
           error == JuiceMakerStateError.outOfStock {
            return showActionAlert(message: error.localizedDescription) { _ in
                self.showModalStockManagementView()
            }
        }
        showBasicAlert(message: error.localizedDescription)
    }
    
    private func getJuiceMaker(uiButton: UIButton) -> JuiceMaker {
        switch uiButton {
        case strawberryOrderButton:
            singleJuiceMaker.setState(state: singleJuiceMaker.strawberryJuiceMakerState)
            return singleJuiceMaker
        case bananaOrderButton:
            singleJuiceMaker.setState(state: singleJuiceMaker.bananaJuiceMakerState)
            return singleJuiceMaker
        case pineappleOrderButton:
            singleJuiceMaker.setState(state: singleJuiceMaker.pineappleJuiceMakerState)
            return singleJuiceMaker
        case kiwiOrderButton:
            singleJuiceMaker.setState(state: singleJuiceMaker.kiwiJuiceMakerState)
            return singleJuiceMaker
        case mangoOrderButton:
            singleJuiceMaker.setState(state: singleJuiceMaker.mangoJuiceMakerState)
            return singleJuiceMaker
        case strawberryBananaOrderButton:
            mixedFruitJuiceMaker.setState(state: mixedFruitJuiceMaker.strawberryBananaJuiceMakerState)
            return mixedFruitJuiceMaker
        case mangoKiwiOrderButton:
            mixedFruitJuiceMaker.setState(state: mixedFruitJuiceMaker.mangoKiwiJuiceMakerState)
            return mixedFruitJuiceMaker
        default:
            return singleJuiceMaker
        }
    }
}

extension MainViewController {
    private func setCount() {
        strawberryStock.text = "\(fruiteStore.strawberry.counter)"
        bananaStock.text = "\(fruiteStore.banana.counter)"
        pineappleStock.text = "\(fruiteStore.pineapple.counter)"
        kiwiStock.text = "\(fruiteStore.kiwi.counter)"
        mangoStock.text = "\(fruiteStore.mango.counter)"
    }
    
    private func addTargetButton() {
        [
            strawberryOrderButton,
            bananaOrderButton,
            pineappleOrderButton,
            kiwiOrderButton,
            mangoOrderButton,
            strawberryBananaOrderButton,
            mangoKiwiOrderButton,
        ]
            .forEach {
                $0.addTarget(self, action: #selector(order), for: .touchUpInside)
            }
    }
    
    private func showModalStockManagementView() {
        guard let stockManagementVC = self.storyboard?.instantiateViewController(
                    withIdentifier: "StockManagementViewController"
                ) as? StockManagementViewController else {
                    return
                }
        stockManagementVC.fruitStore = fruiteStore
        stockManagementVC.delegate = self
        let uiNavigationVC = UINavigationController(rootViewController: stockManagementVC)
        self.present(uiNavigationVC, animated: true, completion: nil)
    }
}

extension MainViewController: StockManagementVCDelegate {
    func touchUpCloseButton() {
        setCount()
    }
}
