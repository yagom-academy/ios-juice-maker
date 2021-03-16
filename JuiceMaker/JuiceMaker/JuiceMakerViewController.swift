//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
//    @IBOutlet var fruitStockLabels: [UILabel]!
    
    
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var starwberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //updateFruitStock()
    }
    
    func makeOrderedJuice(menu: JuiceTypes) {
        if juiceMaker.didMakeJuice(of: menu) {
            showSuccessAlert(menu: menu)
            updateFruitStock()
        } else {
            showFailAlert()
        }
    }
    
    func updateFruitStock() {
        do {
            try strawberryStockLabel.text = juiceMaker.remainFruitStock(of: .strawberry)
            try bananaStockLabel.text = juiceMaker.remainFruitStock(of: .banana)
            try pineappleStockLabel.text = juiceMaker.remainFruitStock(of: .pineapple)
            try kiwiStockLabel.text = juiceMaker.remainFruitStock(of: .kiwi)
            try mangoStockLabel.text = juiceMaker.remainFruitStock(of: .mango)
        } catch {
            print(error)
        }
    }
    
    func showSuccessAlert(menu: JuiceTypes) {
        let alert = UIAlertController(title: nil, message: "\(menu) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showFailAlert() {
        let alert = UIAlertController(title: nil, message: "재고가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func touchUpStrawberryJuiceOrderButton() {
        makeOrderedJuice(menu: .strawberryJuice)
    }
    
    @IBAction func touchUpBananaJuiceOrderButton() {
        makeOrderedJuice(menu: .bananaJuice)
    }
    
    @IBAction func touchUpPineappleJuiceOrderButton() {
        makeOrderedJuice(menu: .pineappleJuice)
    }
    
    @IBAction func touchUpStrawberryBananaJuiceOrderButton() {
        makeOrderedJuice(menu: .strawberryBananaJuice)
    }
    

}

