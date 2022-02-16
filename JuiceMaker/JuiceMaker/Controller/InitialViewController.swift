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
    
    @IBAction func showModifyStocksVC(_ sender: UIBarButtonItem) {
        presentModifyStockView()
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
        let alert = UIAlertController(title: "\(juice)\(AlertTitle.completeMakeJuice)", message: nil, preferredStyle: .alert)
        let okayAlertAction = UIAlertAction(title: AlertTitle.action.okay, style: .default)
        alert.addAction(okayAlertAction)
        present(alert, animated: true)
    }
    
    private func showFailedMakeAlert(about juice: String) {
        let alert = UIAlertController(title: AlertTitle.faliMAkeJuice, message: nil, preferredStyle: .alert)
        let declineAlertActin = UIAlertAction(title: AlertTitle.action.no, style: .cancel)
        let okayAlertAction = UIAlertAction(title: AlertTitle.action.yes, style: .default) { _ in
            self.presentModifyStockView()
        }
        alert.addAction(declineAlertActin)
        alert.addAction(okayAlertAction)
        present(alert, animated: true)
    }
    
    private func presentModifyStockView() {
        let storyboard = UIStoryboard(name: StoryboadName.main, bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: StoryboardID.modifyStock)
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true, completion: nil)
    }
    
}


enum StoryboadName {
    static let main = "main"
}

enum StoryboardID {
    static let modifyStock = ""
}

enum AlertTitle {
    
    static let completeMakeJuice = "쥬스가 나왔습니다! 맛있게 드세요!"
    static let faliMAkeJuice = "재료가 모자라요! 재고를 수정할까요?"
    
    enum action {
        static let okay = "확인"
        static let no = "아니오"
        static let yes = "예"
    }
}
