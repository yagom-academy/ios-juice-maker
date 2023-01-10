//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class JuiceMakerViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockValue: UILabel!
    @IBOutlet weak var bananaStockValue: UILabel!
    @IBOutlet weak var pineappleStockValue: UILabel!
    @IBOutlet weak var kiwiStockValue: UILabel!
    @IBOutlet weak var mangoStockValue: UILabel!
    
    lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
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
    
    func configureCurrentStock() {
        for (fruit, value) in fruitStockValue {
            value.text = String(juiceMaker.fruitStore.checkStockValue(fruit: fruit))
        }
    }
    
    func orderJuice(_ juice: JuiceMaker.Juice) {
        let juice = juiceMaker.makeJuice(juice)
        
        switch juice {
        case .success(let juice):
            configureCurrentStock()
            sendSuccessfulOrderAlert(juice: juice)
        case .failure(let error):
            sendFailedOrderAlert(error: error)
        }
    }
    
    func moveScreen(to viewControllerIdentifier: String) {
        guard let button = self.storyboard?
            .instantiateViewController(withIdentifier: viewControllerIdentifier)
        else { return }
        self.navigationController?.pushViewController(button, animated: true)
    }
    
    func sendSuccessfulOrderAlert(juice: JuiceMaker.Juice) {
        let alert = UIAlertController(title: "제조 성공!",
                                      message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        return present(alert, animated: true, completion: nil)
    }
    
    func sendFailedOrderAlert(error: Error) {
        let alert = UIAlertController(title: "제조 실패!",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default) { _ in
            self.moveScreen(to: "FruitStoreViewController")
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        return present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapReviseStock(_ sender: UIBarButtonItem) {
        moveScreen(to: "FruitStoreViewController")
    }
    
    @IBAction func didTapStrawberryBananaJuiceOrder(_ sender: UIButton) {
        orderJuice(.strawberryBananaJuice)
    }
    
    @IBAction func didTapMangokiwiJuiceOrder(_ sender: UIButton) {
        orderJuice(.mangoKiwiJuice)
    }
    
    @IBAction func didTapStrawberryJuiceOrder(_ sender: UIButton) {
        orderJuice(.strawberryJuice)
    }
    
    @IBAction func didTapBananaJuiceOrder(_ sender: UIButton) {
        orderJuice(.bananaJuice)
    }
    
    @IBAction func didTapPineappleJuiceOrder(_ sender: UIButton) {
        orderJuice(.pineappleJuice)
    }
    
    @IBAction func didTapKiwiJuiceOrder(_ sender: UIButton) {
        orderJuice(.kiwiJuice)
    }
    
    @IBAction func didTapMangoJuiceOrder(_ sender: UIButton) {
        orderJuice(.mangoJuice)
    }
}

