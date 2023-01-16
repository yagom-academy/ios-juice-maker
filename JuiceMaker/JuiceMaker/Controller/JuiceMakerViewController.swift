//  JuiceMaker - JuiceMakerViewController.swift
//  Created by Vetto, 레옹아범 on 2023.01.03

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    private var juiceMaker = JuiceMaker()
    private var getFruits: [Fruit: Int] {
        return juiceMaker.getFruitStore().fruits
    }
    private var strawberryAmount: Int {
        guard let amount = getFruits[.strawberry] else { return 0 }
        return amount
    }
    private var bananaAmount: Int {
        guard let amount = getFruits[.banana] else { return 0 }
        return amount
    }
    private var pineappleAmount: Int {
        guard let amount = getFruits[.pineapple] else { return 0 }
        return amount
    }
    private var kiwiAmount: Int {
        guard let amount = getFruits[.kiwi] else { return 0 }
        return amount
    }
    private var mangoAmount: Int {
        guard let amount = getFruits[.mango] else { return 0 }
        return amount
    }
    
    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel(getFruits)
    }
    
    @IBAction private func didTapChangeFruitStock(_ sender: UIBarButtonItem) {
        pushFruitStockViewController()
    }
    
    @IBAction private func didTapJuiceOrderButton(_ sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text,
              let juice = decideOrderJuice(buttonLabel) else {
            return
        }
        
        tryMakeJuice(juice)
    }
    
    private func setLabel(_ fruits: [Fruit: Int]) {
        strawberryLabel.text = "\(strawberryAmount)"
        bananaLabel.text = "\(bananaAmount)"
        kiwiLabel.text = "\(kiwiAmount)"
        pineappleLabel.text = "\(pineappleAmount)"
        mangoLabel.text = "\(mangoAmount)"
    }
    
    private func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: "\(message) 나왔습니다 맛있게 드세요", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: false)
    }
    
    private func showFailureAlert() {
        let alert = UIAlertController(title: "재료가 모자라요 재료를 수정할까요?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네", style: .default) { (action) in
            self.pushFruitStockViewController()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: false)
    }
    
    private func pushFruitStockViewController() {
        guard let fruitStockViewController = self.storyboard?
            .instantiateViewController(withIdentifier: FruitStockViewController.identifier) as? FruitStockViewController else { return }
        
        fruitStockViewController.setFruits(getFruits)
        fruitStockViewController.delegate = self
        
        self.navigationController?.pushViewController(fruitStockViewController, animated: true)
    }
    
    private func decideOrderJuice(_ juice: String) -> Juice? {
        return Juice.allCases.first { juice == "\($0.name) 주문" }
    }
    
    private func tryMakeJuice(_ juice: Juice) {
        if juiceMaker.makeJuice(juice) {
            showSuccessAlert(message: juice.name)
            updateLabel(juice)
        } else {
            showFailureAlert()
        }
    }
    
    private func updateLabel(_ juice: Juice) {
        let recipe = juice.recipe
        
        for (fruit, _) in recipe {
            switch fruit {
            case .strawberry:
                strawberryLabel.text = "\(strawberryAmount)"
            case .banana:
                bananaLabel.text = "\(bananaAmount)"
            case .pineapple:
                pineappleLabel.text = "\(pineappleAmount)"
            case .kiwi:
                kiwiLabel.text = "\(kiwiAmount)"
            case .mango:
                mangoLabel.text = "\(mangoAmount)"
            }
        }
    }
}

extension JuiceMakerViewController: UpdatableFruitStock {
    func updateStock(changeStock: [Fruit: Int]) {
        self.juiceMaker.setFruitStore(changeStock)
        setLabel(changeStock)
    }
}
