//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet private weak var strawberryStockValue: UILabel!
    @IBOutlet private weak var bananaStockValue: UILabel!
    @IBOutlet private weak var pineappleStockValue: UILabel!
    @IBOutlet private weak var kiwiStockValue: UILabel!
    @IBOutlet private weak var mangoStockValue: UILabel!
    
    private lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
        .strawberry: strawberryStockValue,
        .banana: bananaStockValue,
        .pineapple: pineappleStockValue,
        .kiwi: kiwiStockValue,
        .mango: mangoStockValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCurrentStock()
    }
    
    private func configureCurrentStock() {
        for (fruit, value) in fruitStockValue {
            value.text = String(juiceMaker.fruitStore.checkStockValue(fruit: fruit))
        }
    }
    
    @IBAction private func didTapStrawberryBananaJuiceOrder(_ sender: UIButton) {
        orderJuice(.strawberryBananaJuice)
    }
    
    @IBAction private func didTapMangokiwiJuiceOrder(_ sender: UIButton) {
        orderJuice(.mangoKiwiJuice)
    }
    
    @IBAction private func didTapStrawberryJuiceOrder(_ sender: UIButton) {
        orderJuice(.strawberryJuice)
    }
    
    @IBAction private func didTapBananaJuiceOrder(_ sender: UIButton) {
        orderJuice(.bananaJuice)
    }
    
    @IBAction private func didTapPineappleJuiceOrder(_ sender: UIButton) {
        orderJuice(.pineappleJuice)
    }
    
    @IBAction private func didTapKiwiJuiceOrder(_ sender: UIButton) {
        orderJuice(.kiwiJuice)
    }
    
    @IBAction private func didTapMangoJuiceOrder(_ sender: UIButton) {
        orderJuice(.mangoJuice)
    }
    
    private func orderJuice(_ juice: JuiceMaker.Juice) {
        let juice = juiceMaker.makeJuice(juice)
        
        switch juice {
        case .success(let juice):
            configureCurrentStock()
            sendSuccessfulOrderAlert(juice: juice)
        case .failure(let error):
            sendFailedOrderAlert(error: error)
        }
    }
    
    private func sendSuccessfulOrderAlert(juice: JuiceMaker.Juice) {
        let alert = UIAlertController(title: "제조 성공!",
                                      message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    private func sendFailedOrderAlert(error: Error) {
        let alert = UIAlertController(title: "제조 실패!",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default) { _ in
            self.moveScreen(to: "FruitStoreViewController")
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    private func moveScreen(to viewControllerIdentifier: String) {
        guard let button = self.storyboard?
            .instantiateViewController(withIdentifier: viewControllerIdentifier)
        else { return }
        self.navigationController?.pushViewController(button, animated: true)
    }
    
    @IBAction private func didTapReviseStock(_ sender: UIBarButtonItem) {
        moveScreen(to: "FruitStoreViewController")
    }
}
