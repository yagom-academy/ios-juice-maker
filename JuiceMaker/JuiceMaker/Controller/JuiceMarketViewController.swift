//
//  JuiceMaker - ViewController.swift
//  Created by uemu, Toy.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMarketViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        linkStockAndLabel()
    }

    func linkStockAndLabel() {
        fruitStore.fruitQuantity.forEach{(key, value) in
            switch key {
            case .strawberry:
                strawberryLabel.text = String(value)
            case .banana:
                bananaLabel.text = String(value)
            case .kiwi:
                kiwiLabel.text = String(value)
            case .mango:
                mangoLabel.text = String(value)
            case .pineapple:
                pineappleLabel.text = String(value)
            }
        }
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        guard let order = sender.currentTitle,
             let juice = FruitJuice.Order(rawValue: order)?.juiceOrder else { return }
        do {
            try juiceMaker.manufactureFruitJuice(in: juice)
            linkStockAndLabel()
            appearSuccessMessageAlert(juice: juice.rawValue)
        } catch let error {
            appearFailMessageAlert(errorDescription: error.localizedDescription)
        }
    }
    
    private func appearFailMessageAlert(errorDescription: String) {
        let alert = UIAlertController(title: errorDescription, message: nil, preferredStyle: .alert)
        let success = UIAlertAction(title: "예", style: .default) { _ in
            guard let vc = self.storyboard?.instantiateViewController(identifier: Identifier.id) else { return }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    private func appearSuccessMessageAlert(juice: String) {
        let alert = UIAlertController(title: "\(juice) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let success = UIAlertAction(title: "예", style: .default)
        
        alert.addAction(success)
        
        self.present(alert, animated: true)
    }
}

