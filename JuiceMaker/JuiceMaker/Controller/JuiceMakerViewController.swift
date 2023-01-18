//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by Andrew, 혜모리 on 2023.01.02
//

import UIKit

final class JuiceMakerViewController: UIViewController, StockUpdateableDelegate {
    let juiceMaker = JuiceMaker()
    var currentStockList: [FruitStore.Fruit: Int] = [:]
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    private lazy var fruitStockValue: [FruitStore.Fruit: UILabel] = [
        .strawberry: strawberryLabel,
        .banana: bananaLabel,
        .pineapple: pineappleLabel,
        .kiwi: kiwiLabel,
        .mango: mangoLabel
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCurrentStock()
        self.navigationController?.navigationBar.backgroundColor = .systemGray4
    }
    
    private func configureCurrentStock() {
        for (fruit, value) in fruitStockValue {
            value.text = String(juiceMaker.fruitStore.checkStockValue(fruit: fruit))
            currentStockList[fruit] = Int(value.text ?? "0")
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
            self.moveScreen()
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
    
    private func moveScreen() {
        guard let fruitStoreVC = storyboard?
            .instantiateViewController(withIdentifier: "FruitStoreViewController") as? FruitStoreViewController else { return }
        fruitStoreVC.delegate = self
        fruitStoreVC.currentStockList = currentStockList
        fruitStoreVC.modalPresentationStyle = .fullScreen
        present(fruitStoreVC, animated: true, completion: nil)
    }
    
    @IBAction private func didTapReviseStock(_ sender: UIBarButtonItem) {
        moveScreen()
    }
    
    func updateStock(to stockList: [FruitStore.Fruit : Int]) {
        juiceMaker.fruitStore.updateStock(to: stockList)
        configureCurrentStock()
    }
}
