//
//  JuiceMaker - ViewController.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
   
    override func viewDidLoad() {
       super.viewDidLoad()
        
        updateStockLabel()
    }
    
    func updateStockLabel() {
        strawberryStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction func ddalbaJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .strawberryBananaJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction func strawberryJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .strawberryJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction func bananaJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .bananaJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction func pineappleJuieButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .pineappleJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction func kiwiJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .kiwiJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction func mangoJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .mangoJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction func mankiJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .mangoKiwiJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toSecondVC", sender: self)
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


