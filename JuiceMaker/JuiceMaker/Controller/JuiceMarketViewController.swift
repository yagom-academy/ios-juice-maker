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
    
    private var juiceMaker = JuiceMaker()
    private var fruitStore = FruitStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }

    func showStock() {
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
    
    @IBAction func manufactureJuice(_ sender: UIButton) {
        guard let order = sender.currentTitle else { return }
        guard let juice = FruitJuice.Order(rawValue: order)?.juiceOrder else { return }
        do {
            try juiceMaker.manufactureFruitJuice(in: juice)
            showStock()
            appearSuccessMessageAlert(juice: juice.rawValue)
        } catch {
            appearFailMessageAlert()
        }
    }
    
    private func appearFailMessageAlert() {
        let alert = UIAlertController(title: "재고가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let success = UIAlertAction(title: "예", style: .default) { _ in
            guard let vc = self.storyboard?.instantiateViewController(identifier: "FruitQuantityViewController") else { return }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        let cancel = UIAlertAction(title: "아니오", style: .cancel) { _ in }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func appearSuccessMessageAlert(juice: String) {
        let alert = UIAlertController(title: "\(juice) 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let success = UIAlertAction(title: "예", style: .default) { _ in }
        
        alert.addAction(success)
        
        self.present(alert, animated: true, completion: nil)
    }
}

