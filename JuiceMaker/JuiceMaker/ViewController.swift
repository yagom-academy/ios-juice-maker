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
    
    var juiceMaker: JuiceMaker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initializeStockValue = 10
        juiceMaker = JuiceMaker(stock: initializeStockValue)
        initializeLabel(stock: initializeStockValue)
    }
    
    func initializeLabel(stock: Int) {
        strawberryStockLabel.text = String(stock)
        bananaStockLabel.text = String(stock)
        pineappleStockLabel.text = String(stock)
        kiwiStockLabel.text = String(stock)
        mangoStockLabel.text = String(stock)
    }
    
    func orderJuice() {
        if juiceMaker.makeJuice(memu: .strawberryAndBanana) == .success {
            let alert = UIAlertController(title: "딸바쥬스 나왔습니다.", message: "맛있게 드세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "재고가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
            alert.addAction(UIAlertAction(title: "예", style: .default) { _ in
                guard let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockViewController") else {
                    return
                }
                self.navigationController?.pushViewController(stockViewController, animated: true)
            })
            present(alert, animated: true)
        }
    }
    
    @IBAction func pressedStrawberryAndBananaJuiceButton(_ sender: UIButton) {
        orderJuice()
    }
    
    @IBAction func pressedMangoAndKiwiJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func pressedStrawberryJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func pressedBananaJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func pressedPineappleJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func pressedKiwiJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func pressedMangoJuiceButton(_ sender: UIButton) {
    }
}
