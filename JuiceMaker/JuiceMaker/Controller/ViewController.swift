//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var juiceMaker = JuiceMaker()
   
    override func viewDidLoad() {
       super.viewDidLoad()
        
        updateStockLabel()
    }
    
    func updateStockLabel() {
        strawberryStockLabel.text = juiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = juiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = juiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction func ddalbaJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .strawberryBananaJuice
        juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.juiceName)
    }
    
    @IBAction func strawberryJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .strawberryJuice
        juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.juiceName)
    }
    
    @IBAction func bananaJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .bananaJuice
        juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.juiceName)
    }
    
    @IBAction func pineappleJuieButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .pineappleJuice
        juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.juiceName)
    }
    
    @IBAction func kiwiJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .kiwiJuice
        juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.juiceName)
    }
    
    @IBAction func mangoJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .mangoJuice
        juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.juiceName)
    }
    
    @IBAction func mankiJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .mangoKiwiJuice
        juiceMaker.makeJuice(orderedJuice)
        updateStockLabel()
        successAlert(name: orderedJuice.juiceName)
    }
    
    func successAlert(name: String) {
        let alert = UIAlertController(title: "\(name) 나왔습니다! 맛있게 드세요!",message: nil, preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func failAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
}

