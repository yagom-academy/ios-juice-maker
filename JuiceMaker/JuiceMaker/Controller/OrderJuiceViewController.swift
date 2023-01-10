//
//  JuiceMaker - ViewController.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class OrderJuiceViewController: UIViewController {
    
    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
   
    override func viewDidLoad() {
       super.viewDidLoad()
        
        updateStockLabel()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = JuiceMaker.sharedJuiceMaker.currentFruitStock(of: .mango)
    }
    
    @IBAction private func ddalbaJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .strawberryBananaJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction private func strawberryJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .strawberryJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction private func bananaJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .bananaJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction private func pineappleJuieButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .pineappleJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction private func kiwiJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .kiwiJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction private func mangoJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .mangoJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction private func mankiJuiceButtonTapped(_ sender: UIButton) {
        let orderedJuice: JuiceMenu = .mangoKiwiJuice
        if JuiceMaker.sharedJuiceMaker.makeJuice(orderedJuice) {
            updateStockLabel()
            successAlert(name: orderedJuice.juiceName)
        } else {
            failAlert()
        }
    }
    
    @IBAction private func manageStockBarButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toManageVC", sender: self)
    }
    
    private func successAlert(name: String) {
        let alert = UIAlertController(title: "\(name) 나왔습니다! 맛있게 드세요!",message: nil, preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "확인", style: .default)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    private func failAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: { action in self.performSegue(withIdentifier: "toManageVC", sender: nil) })
        let cancel = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}


