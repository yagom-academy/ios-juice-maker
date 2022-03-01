//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var fruitLabelCollection: [UILabel]!
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsStock()
    }
    
    private func updateFruitsStock() {
        var index:Int = .zero
        for fruit in Fruit.allCases {
            guard let stock = FruitStore.shared.inventory[fruit] else {
                return
            }
            fruitLabelCollection[index].text = String(stock)
            index += 1
        }
    }
    
    func showSuccessAlert(juice: String) {
        let successAlert = UIAlertController(title: "\(juice)쥬스 나왔습니다", message: "맛있게드세요", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "네", style: .default))
        present(successAlert, animated: true)
    }
    
    func showFailAlert() {
        let failAlert = UIAlertController(title: "재료부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        failAlert.addAction(UIAlertAction(title: "네", style: .default, handler: { _ in
            guard let fruitStoreVC = self.storyboard?.instantiateViewController(identifier: "FruitStoreVC") else {
                return
            }
            self.navigationController?.pushViewController(fruitStoreVC, animated: true)}))
        failAlert.addAction(UIAlertAction(title: "아니요", style: .destructive))
        present(failAlert, animated: true)
    }
    
    @IBAction func makeStrawberryBananaJuiceButton(_ sender: UIButton) {
        switch juiceMaker.makeJuice(by: .strawberryBananaJuice) {
        case true:
            showSuccessAlert(juice: Juice.strawberryBananaJuice.rawValue)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
    
    @IBAction func makeMangoKiwiJuiceButton(_ sender: UIButton) {
        switch juiceMaker.makeJuice(by: .mangoKiwiJuice) {
        case true:
            showSuccessAlert(juice: Juice.mangoKiwiJuice.rawValue)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
    
    @IBAction func makeStrawberryJuiceButton(_ sender: UIButton) {
        switch juiceMaker.makeJuice(by: .strawberryJuice) {
        case true:
            showSuccessAlert(juice: Juice.strawberryJuice.rawValue)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
    
    @IBAction func makeBananaJuiceButton(_ sender: UIButton) {
        switch juiceMaker.makeJuice(by: .bananaJuice) {
        case true:
            showSuccessAlert(juice: Juice.bananaJuice.rawValue)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
    
    @IBAction func makePineappleJuiceButton(_ sender: UIButton) {
        switch juiceMaker.makeJuice(by: .pineappleJuice) {
        case true:
            showSuccessAlert(juice: Juice.pineappleJuice.rawValue)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
    
    
    @IBAction func makeKiwiJuiceButton(_ sender: UIButton) {
        switch juiceMaker.makeJuice(by: .kiwiJuice) {
        case true:
            showSuccessAlert(juice: Juice.kiwiJuice.rawValue)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
    
    @IBAction func makeMangoJuiceButton(_ sender: UIButton) {
        switch juiceMaker.makeJuice(by: .mangoJuice) {
        case true:
            showSuccessAlert(juice: Juice.mangoJuice.rawValue)
            updateFruitsStock()
        case false:
            showFailAlert()
        }
    }
}
