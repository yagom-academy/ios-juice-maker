//  JuiceMaker - ViewController.swift
//  Created by Vetto, 레옹아범 on 2023.01.03

import UIKit

final class ViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak private var strawberryLabel: UILabel!
    @IBOutlet weak private var bananaLabel: UILabel!
    @IBOutlet weak private var kiwiLabel: UILabel!
    @IBOutlet weak private var pineappleLabel: UILabel!
    @IBOutlet weak private var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel(juice: juiceMaker.getFruitsInStore())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateLabel(juice: juiceMaker.getFruitsInStore())
    }
    
    @IBAction private func clickButton(_ sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text,
        let juice = decideOrderJuice(buttonLabel) else {
            return
        }
        
        tryMakeJuice(juice)
    }
    
    private func updateLabel(juice: [Fruit: Int]) {
        guard let strawberry = juice[.strawberry],
              let banana = juice[.banana],
              let kiwi = juice[.kiwi],
              let pineapple = juice[.pineapple],
              let mango = juice[.mango] else { return }
        
        strawberryLabel.text = String(strawberry)
        bananaLabel.text = String(banana)
        kiwiLabel.text = String(kiwi)
        pineappleLabel.text = String(pineapple)
        mangoLabel.text = String(mango)
    }
    
    private func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: "\(message) 나왔습니다 맛있게 드세요", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: false) {
            self.updateLabel(juice: self.juiceMaker.getFruitsInStore())
        }
    }
    
    private func showFailureAlert() {
        let alert = UIAlertController(title: "재료가 모자라요 재료를 수정할까요?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네", style: .default) { (action) in
            guard let fruitStockViewController = self.storyboard?
                .instantiateViewController(withIdentifier: "FruitStockViewController") else { return }
            self.navigationController?.pushViewController(fruitStockViewController, animated: false)
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: false)
    }
    
    private func decideOrderJuice(_ juice: String) -> Juice? {
        switch juice {
        case "딸바쥬스 주문":
            return .strawberryBananaJuice
        case "딸기쥬스 주문":
            return .strawberryJuice
        case "바나나쥬스 주문":
            return .bananaJuice
        case "파인애플쥬스 주문":
            return .pineappleJuice
        case "망키쥬스 주문":
            return .mangoKiwiJuice
        case "키위쥬스 주문":
            return .kiwiJuice
        case "망고쥬스 주문":
            return .mangoJuice
        default:
            return nil
        }
    }
    
    private func tryMakeJuice(_ juice: Juice) {
        if juiceMaker.makeJuice(juice) {
            showSuccessAlert(message: juice.name)
        } else {
            showFailureAlert()
        }
    }
}

