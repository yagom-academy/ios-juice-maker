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
    
    @IBAction func pressedStrawberryAndBananaJuiceButton(_ sender: UIButton) {
        if juiceMaker.makeJuice(memu: .strawberryAndBanana) == .success {
            let alert = UIAlertController(title: "딸바쥬스 나왔습니다.", message: "맛있게 드세요!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
        }
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
