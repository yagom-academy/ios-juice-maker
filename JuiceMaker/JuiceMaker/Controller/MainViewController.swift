//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    @IBOutlet weak var strawberryOrderButton: UIButton!
    @IBOutlet weak var bananaOrderButton: UIButton!
    @IBOutlet weak var pineappleOrderButton: UIButton!
    @IBOutlet weak var kiwiOrderButton: UIButton!
    @IBOutlet weak var mangoOrderButton: UIButton!
    @IBOutlet weak var strawberryBananaOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiOrderButton: UIButton!
    
    var fruiteStore: FruitStore = {
        return FruitStore(
            strawberryCount: 18,
            bananaCount: 10,
            kiwiCount: 10,
            pineappleCount: 10,
            mangoCount: 10
        )
    }()
    
    lazy var singleJuiceMaker: SingleFruitJuiceMaker = {
        SingleFruitJuiceMaker(fruitStore: fruiteStore)
    }()
    
    lazy var mixedFruitJuiceMaker: MixedFruitJuiceMaker = {
        MixedFruitJuiceMaker(fruitStore: fruiteStore)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCount()
        addTargetButton()
    }
}

extension MainViewController {
    @objc func order(_ sender: UIButton) {
        do {
            let message = try getJuiceMaker(uiButton: sender).order()
            setCount()
            showAlert(message: message ?? "")
        } catch {
            catchOrderError(error: error)
        }
    }
    
    func catchOrderError(error: Error) {
        if let error = error as? JuiceMakerStateError,
           error == JuiceMakerStateError.outOfStock {
            return showAlert(message: error.localizedDescription) { alert in
                // show modal
            }
        }
        showAlert(message: error.localizedDescription)
    }
    
    func getJuiceMaker(uiButton: UIButton) -> JuiceMaker {
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
    func setCount() {
        strawberryStock.text = "\(fruiteStore.strawberry.counter)"
        bananaStock.text = "\(fruiteStore.banana.counter)"
        pineappleStock.text = "\(fruiteStore.pineapple.counter)"
        kiwiStock.text = "\(fruiteStore.kiwi.counter)"
        mangoStock.text = "\(fruiteStore.mango.counter)"
    }
    
    func addTargetButton() {
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
}
