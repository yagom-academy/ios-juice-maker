//
//  JuiceMaker - ViewController.swift
//  Created by Rhode, christy
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    let fruitStore = FruitStore.shared
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
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
        if let strawberry = fruitStore.fruitStock[.딸기] {
            strawberryStock.text = String(strawberry)
        }
        if let banana = fruitStore.fruitStock[.바나나] {
            bananaStock.text = String(banana)
        }
        if let pineapple = fruitStore.fruitStock[.파인애플] {
            pineappleStock.text = String(pineapple)
        }
        if let kiwi = fruitStore.fruitStock[.키위] {
            kiwiStock.text = String(kiwi)
        }
        if let mango = fruitStore.fruitStock[.망고] {
            mangoStock.text = String(mango)
        }
    }
    
    @IBAction func strawberryBananaTapped(_ sender: UIButton) {
        setButton(juiceName: .딸바쥬스)
    }
    
    @IBAction func strawberryTapped(_ sender: UIButton) {
        setButton(juiceName: .딸기쥬스)
    }
    
    @IBAction func bananaTapped(_ sender: UIButton) {
        setButton(juiceName: .바나나쥬스)
    }
    
    @IBAction func pineappleTapped(_ sender: UIButton) {
        setButton(juiceName: .파인애플쥬스)
    }
    
    @IBAction func mangoKiwiTapped(_ sender: UIButton) {
        setButton(juiceName: .망고키위쥬스)
    }
    
    @IBAction func kiwiTapped(_ sender: UIButton) {
        setButton(juiceName: .키위쥬스)
    }
    
    @IBAction func mangoTapped(_ sender: UIButton) {
        setButton(juiceName: .망고쥬스)
    }
    
    func makeAlertJuiceDidMade(juice: Juice) {
        let alertJuiceDidMade = UIAlertController(title: "성공", message: "\(juice) 나왔습니다! 맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let takeJuice = UIAlertAction(title: "쥬스 받기", style: .default)
        alertJuiceDidMade.addAction(takeJuice)
        present(alertJuiceDidMade, animated: false, completion: nil)
    }
    
    func makeAlertOutOfStock() {
        let alertOutOfStock = UIAlertController(title: "실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: UIAlertController.Style.alert)
        let modifyYes = UIAlertAction(title: "예", style: .default) { (action) in
            guard let stockModifyButton = self.storyboard?.instantiateViewController(withIdentifier: "stockModifyViewController") else { return }
            self.navigationController?.pushViewController(stockModifyButton, animated: true)
        }
        let modifyNo = UIAlertAction(title: "아니오", style: .cancel)
        alertOutOfStock.addAction(modifyYes)
        alertOutOfStock.addAction(modifyNo)
        present(alertOutOfStock, animated: false, completion: nil)
    }
    
    func setButton(juiceName: Juice) {
        let juiceMaker = JuiceMaker()
        if let juice = juiceMaker.makeJuice(juiceName: juiceName) {
            makeAlertJuiceDidMade(juice: juice)
        } else {
            makeAlertOutOfStock()
        }
        if let strawberryStocks = fruitStore.fruitStock[.딸기] {
            strawberryStock.text = String(strawberryStocks)
        }
        if let bananaStocks = fruitStore.fruitStock[.바나나] {
            bananaStock.text = String(bananaStocks)
        }
        if let pineappleStocks = fruitStore.fruitStock[.파인애플] {
            pineappleStock.text = String(pineappleStocks)
        }
        if let kiwiStocks = fruitStore.fruitStock[.키위] {
            kiwiStock.text = String(kiwiStocks)
        }
        if let mangoStocks = fruitStore.fruitStock[.망고] {
            mangoStock.text = String(mangoStocks)
        }
    }
    
    @IBAction func stockModifyTapped(_ sender: UIBarButtonItem) {
        guard let stockModifyButton = self.storyboard?.instantiateViewController(withIdentifier: "stockModifyViewController") else {
            return
        }
        self.navigationController?.pushViewController(stockModifyButton, animated: true)
        self.navigationController?.navigationBar.topItem?.backButtonTitle = "돌아가기"
    }
    
}

