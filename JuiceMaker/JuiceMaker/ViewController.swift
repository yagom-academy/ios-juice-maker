//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker: JuiceMaker = JuiceMaker()
    private let warning: String = "경고"
    private let complete: String = "완료"
    @IBOutlet weak var changeStockButton: UIButton!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //todo -> 화면전환할때 값을 같이 보내는 방법을 찾아서 step3를 진행할것
        showFruitsStock()
    }
    
    func showFruitsStock() {
        let strawberryStock: Int = juiceMaker.stockManager.strawberry.stock
        let bananaStock: Int = juiceMaker.stockManager.banana.stock
        let pineappleStock: Int = juiceMaker.stockManager.pineapple.stock
        let kiwiStock: Int = juiceMaker.stockManager.kiwi.stock
        let mangoStock: Int = juiceMaker.stockManager.mango.stock
        
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        kiwiStockLabel.text = String(kiwiStock)
        mangoStockLabel.text = String(mangoStock)
    }
        
    @IBAction func touchUpStrawberryBananaJuiceButton(_ sender: UIButton) {
        let strawberryBananaJuice: String = "딸기바나나쥬스"
        guard let menu = FruitsJuice(rawValue: strawberryBananaJuice) else { return }
        do {
            try juiceMaker.makeJuice(orderedJuice: menu)
            showAlert(type: complete, juiceName: strawberryBananaJuice)
            showFruitsStock()
        }
        catch {
            showAlert(type: warning)
        }
    }
    
    @IBAction func touchUpMangoKiwiJuiceButton(_ sender: UIButton) {
        let mangoKiwiJuice: String = "망고키위쥬스"
        guard let menu = FruitsJuice(rawValue: mangoKiwiJuice) else { return }
        do {
            try juiceMaker.makeJuice(orderedJuice: menu)
            showAlert(type: complete, juiceName: mangoKiwiJuice)
            showFruitsStock()
        }
        catch {
            showAlert(type: warning)
        }
    }
    
    @IBAction func touchUpStrawberryJuiceButton(_ sender: UIButton) {
        let strawberryJuice: String = "딸기쥬스"
        guard let menu = FruitsJuice(rawValue: strawberryJuice) else { return }
        do {
            try juiceMaker.makeJuice(orderedJuice: menu)
            showAlert(type: complete, juiceName: strawberryJuice)
            showFruitsStock()
        }
        catch {
            showAlert(type: warning)
        }
    }
    
    @IBAction func touchUpBananaJuiceButton(_ sender: UIButton) {
        let bananaJuice: String = "바나나쥬스"
        guard let menu = FruitsJuice(rawValue: bananaJuice) else { return }
        do {
            try juiceMaker.makeJuice(orderedJuice: menu)
            showAlert(type: complete, juiceName: bananaJuice)
            showFruitsStock()
        }
        catch {
            showAlert(type: warning)
        }
    }
    
    @IBAction func touchUpPineappleJuiceButton(_ sender: UIButton) {
        let pineappleJuice: String = "파인애플쥬스"
        guard let menu = FruitsJuice(rawValue: pineappleJuice) else { return }
        do {
            try juiceMaker.makeJuice(orderedJuice: menu)
            showAlert(type: complete, juiceName: pineappleJuice)
            showFruitsStock()
        }
        catch {
            showAlert(type: warning)
        }
    }
    
    @IBAction func touchUpKiwiJuiceButton(_ sender: UIButton) {
        let kiwiJuice: String = "키위쥬스"
        guard let menu = FruitsJuice(rawValue: kiwiJuice) else { return }
        do {
            try juiceMaker.makeJuice(orderedJuice: menu)
            showAlert(type: complete, juiceName: kiwiJuice)
            showFruitsStock()
        }
        catch {
            showAlert(type: warning)
        }
    }
    
    @IBAction func touchUpMangoJuiceButton(_ sender: UIButton) {
        let mangoJuice: String = "망고쥬스"
        guard let menu = FruitsJuice(rawValue: mangoJuice) else { return }
        do {
            try juiceMaker.makeJuice(orderedJuice: menu)
            showAlert(type: complete, juiceName: mangoJuice)
            showFruitsStock()
        }
        catch {
            showAlert(type: warning)
        }
    }
    
    @IBAction func touchUpChangeStockButton(_ sender: UIButton) {
        self.moveToStockManageVC()
    }
    
    func moveToStockManageVC() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "StockManageVC") else {
            return
        }
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true, completion: nil)
    }
    
    func showAlert(type: String, juiceName: String? = nil) {
        switch type {
        case warning:
            let warningMessage: String = "재료가 모자라요! 재고를 수정할까요?"
            let alert = UIAlertController(title: nil, message: warningMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "예", style: .default) { ACTION in
                self.moveToStockManageVC()
            }
            let noAction = UIAlertAction(title: "아니오", style: .cancel)
            
            alert.addAction(okAction)
            alert.addAction(noAction)
            present(alert, animated: true, completion: nil)
        case complete:
            guard let menu = juiceName else { return }
            let completeMessage: String = "\(menu) 나왔습니다! 맛있게 드세요!"
            let alert = UIAlertController(title: nil, message: completeMessage, preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "닫기", style: .cancel)
            
            alert.addAction(closeAction)
            present(alert, animated: true, completion: nil)
        default:
            return
        }
    }
}

