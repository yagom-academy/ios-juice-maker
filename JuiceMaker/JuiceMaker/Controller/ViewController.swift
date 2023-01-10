//
//  JuiceMaker - ViewController.swift
//  Created by Rhode, christy
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {

    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryStockUILabel: UILabel!
    @IBOutlet weak var bananaStockUILabel: UILabel!
    @IBOutlet weak var pineappleStockUILabel: UILabel!
    @IBOutlet weak var kiwiStockUILabel: UILabel!
    @IBOutlet weak var mangoStockUILabel: UILabel!
    
    @IBOutlet weak var strawberryBananaButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    
    @IBOutlet weak var stockModifyButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStocks()
    }
    
    @IBAction func touchJuiceButton(_ sender: UIButton) {
        selectJuiceButton(tag: sender.tag)
    }
    
    func displayStocks() {
        if let strawberry = fruitStore.fruitStock[.딸기] {
            strawberryStockUILabel.text = String(strawberry)
        }
        if let banana = fruitStore.fruitStock[.바나나] {
            bananaStockUILabel.text = String(banana)
        }
        if let pineapple = fruitStore.fruitStock[.파인애플] {
            pineappleStockUILabel.text = String(pineapple)
        }
        if let kiwi = fruitStore.fruitStock[.키위] {
            kiwiStockUILabel.text = String(kiwi)
        }
        if let mango = fruitStore.fruitStock[.망고] {
            mangoStockUILabel.text = String(mango)
        }
    }
    
    private func selectJuiceButton(tag: Int) {
        let juiceMaker = JuiceMaker()
        switch tag {
        case 1:
            if juiceMaker.makeJuice(juiceName: .딸바쥬스) != nil {
                presentAlertJuiceDidMade(juice: .딸바쥬스)
            } else { presentAlertOutOfStock() }
        case 2:
            if juiceMaker.makeJuice(juiceName: .딸기쥬스) != nil {
                presentAlertJuiceDidMade(juice: .딸기쥬스)
            } else { presentAlertOutOfStock() }
        case 3:
            if juiceMaker.makeJuice(juiceName: .바나나쥬스) != nil {
                presentAlertJuiceDidMade(juice: .바나나쥬스)
            } else { presentAlertOutOfStock() }
        case 4:
            if juiceMaker.makeJuice(juiceName: .파인애플쥬스) != nil {
                presentAlertJuiceDidMade(juice: .파인애플쥬스)
            } else { presentAlertOutOfStock() }
        case 5:
            if juiceMaker.makeJuice(juiceName: .망고키위쥬스) != nil {
                presentAlertJuiceDidMade(juice: .망고키위쥬스)
            } else { presentAlertOutOfStock() }
        case 6:
            if juiceMaker.makeJuice(juiceName: .키위쥬스) != nil {
                presentAlertJuiceDidMade(juice: .키위쥬스)
            } else { presentAlertOutOfStock() }
        case 7:
            if juiceMaker.makeJuice(juiceName: .망고쥬스) != nil {
                presentAlertJuiceDidMade(juice: .망고쥬스)
            } else { presentAlertOutOfStock() }
        default:
            break
        }
        displayStocks()
    }
    
    private func presentAlertJuiceDidMade(juice: Juice) {
        let alertJuiceDidMade = UIAlertController(title: "성공", message: "\(juice) 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let takeJuice = UIAlertAction(title: "쥬스 받기", style: .default)
        alertJuiceDidMade.addAction(takeJuice)
        present(alertJuiceDidMade, animated: false, completion: nil)
    }
    
    private func presentAlertOutOfStock() {
        let alertOutOfStock = UIAlertController(title: "실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { (action) in
            guard let stockModifyButton = self.storyboard?.instantiateViewController(withIdentifier: "stockModifyViewController") else { return }
            self.navigationController?.pushViewController(stockModifyButton, animated: true)
        }
        let noAction = UIAlertAction(title: "아니오", style: .cancel)
        alertOutOfStock.addAction(yesAction)
        alertOutOfStock.addAction(noAction)
        present(alertOutOfStock, animated: false, completion: nil)
    }
    
    @IBAction func stockModifyTapped(_ sender: UIBarButtonItem) {
        guard let stockModifyButton = self.storyboard?.instantiateViewController(withIdentifier: "stockModifyViewController") else {
            return
        }
        self.navigationController?.pushViewController(stockModifyButton, animated: true)
    }
}

