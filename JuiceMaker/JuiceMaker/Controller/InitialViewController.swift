//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class InitialViewController: UIViewController {
    
    var fruitStore = FruitStore(manager: FruitStockManager(stocks: [
        .strawberry:10,
        .banana:10,
        .mango:10,
        .pineapple:10,
        .kiwi:10])
    )
    
    private lazy var juiceMaker = JuiceMaker(store: fruitStore)
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var orederStrawberryJuiceButton: UIButton!
    @IBOutlet weak var orederBananaJuiceButton: UIButton!
    @IBOutlet weak var orederPineappleJuiceButton: UIButton!
    @IBOutlet weak var orederKiwiJuiceButton: UIButton!
    @IBOutlet weak var orederMangoJuiceButton: UIButton!
    @IBOutlet weak var orederStrawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var orederMangoKiwiJuiceButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLabel()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        switch sender {
        case orederStrawberryJuiceButton:
            tryMake(.strawberryJuice)
        case orederBananaJuiceButton:
            tryMake(.bananaJuice)
        case orederPineappleJuiceButton:
            tryMake(.pineappleJuice)
        case orederKiwiJuiceButton:
            tryMake(.kiwiJuice)
        case orederMangoJuiceButton:
            tryMake(.mangoJuice)
        case orederStrawberryBananaJuiceButton:
            tryMake(.strawberryBananaJuice)
        case orederMangoKiwiJuiceButton:
            tryMake(.strawberryBananaJuice)
        default:
            break
        }
        updateFruitLabel()
    }

    private func updateFruitLabel() {
        strawberryStockLabel.text = "\(fruitStore.checkCount(stock: .strawberry))"
        bananaStockLabel.text = "\(fruitStore.checkCount(stock: .banana))"
        pineappleStockLabel.text = "\(fruitStore.checkCount(stock: .pineapple))"
        kiwiStockLabel.text = "\(fruitStore.checkCount(stock: .kiwi))"
        mangoStockLabel.text = "\(fruitStore.checkCount(stock: .mango))"
    }
    
    
    private func tryMake(_ juice: Juice) {
        var result: Bool = false
        do {
            result = try juiceMaker.make(into: juice)
        } catch {
            print("\(error.localizedDescription)")
        }
        if result == true {
            showCompleteMakeAlert(about: juice.name)
        } else {
            showFailedMakeAlert(about: juice.name)
        }
    }
    
    private func showCompleteMakeAlert(about juice: String) {
        let alert = UIAlertController(title: "\(juice)쥬스가 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let okayAlertAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okayAlertAction)
        present(alert, animated: true)
    }
    
    private func showFailedMakeAlert(about juice: String) {
        let alert = UIAlertController(title: "재료가 모자라요! 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let cancleAlertActin = UIAlertAction(title: "취소", style: .cancel)
        let okayAlertAction = UIAlertAction(title: "예", style: .default) { _ in
            //TODO: MOVE Modify Stock VC
        }
        alert.addAction(cancleAlertActin)
        alert.addAction(okayAlertAction)
        present(alert, animated: true)
    }
    
}

