//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet private weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet private weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet private weak var starwberryBananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceOrderButton: UIButton!
    
    private let juiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func makeOrderedJuice(menu: JuiceTypes) {
        if juiceMaker.didMakeJuice(of: menu) {
            showOrderSuccessAlert(menu: menu)
            updateFruitStock()
        } else {
            showOrderFailAlert()
        }
    }
    
    func updateFruitStock() {
        do {
            try strawberryStockLabel.text = juiceMaker.fruitStock(of: .strawberry)
            try bananaStockLabel.text = juiceMaker.fruitStock(of: .banana)
            try pineappleStockLabel.text = juiceMaker.fruitStock(of: .pineapple)
            try kiwiStockLabel.text = juiceMaker.fruitStock(of: .kiwi)
            try mangoStockLabel.text = juiceMaker.fruitStock(of: .mango)
        } catch {
            print(error)
        }
    }

    private func showOrderSuccessAlert(menu: JuiceTypes) {
        let alert = UIAlertController(title: nil, message: "\(menu) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showOrderFailAlert() {
        let alert = UIAlertController(title: nil, message: "재고가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { (action) in
            self.moveStockManagerVC()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func moveStockManagerVC() {
        guard let stockManagerVC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerVC") as? StockManagerViewController else { return }
        self.present(stockManagerVC, animated: true, completion: nil)
    }

    @IBAction private func touchUpStrawberryJuiceOrderButton() {
        makeOrderedJuice(menu: .strawberryJuice)
    }
    
    @IBAction private func touchUpBananaJuiceOrderButton() {
        makeOrderedJuice(menu: .bananaJuice)
    }
    
    @IBAction private func touchUpPineappleJuiceOrderButton() {
        makeOrderedJuice(menu: .pineappleJuice)
    }
    
    @IBAction private func touchUpKiwiJuiceOrderButton() {
        makeOrderedJuice(menu: .kiwiJuice)
    }
    
    @IBAction private func touchUpMangoJuiceOrderButton() {
        makeOrderedJuice(menu: .mangoJuice)
    }
    
    @IBAction private func touchUpStrawberryBananaJuiceOrderButton() {
        makeOrderedJuice(menu: .strawberryBananaJuice)
    }
    
    @IBAction private func touchUpMangoKiwiJuiceOrderButton() {
        makeOrderedJuice(menu: .mangoKiwiJuice)
    }
}
