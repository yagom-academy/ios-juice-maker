//
//  JuiceMaker - ViewController.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateStock()
    }
    
    @IBAction func strawberrybananaButton(_ sender: UIButton) {
        buttonEvent(juice: .strawberryBanana)
        updateStock()
    }
    @IBAction func mangokiwiButton(_ sender: UIButton) {
        buttonEvent(juice: .mangoKiwi)
        updateStock()
    }
    @IBAction func strawberryButton(_ sender: UIButton) {
        buttonEvent(juice: .strawberry)
        updateStock()
    }
    @IBAction func bananaButton(_ sender: UIButton) {
        buttonEvent(juice: .banana)
        updateStock()
    }
    @IBAction func pineappleButton(_ sender: UIButton) {
        buttonEvent(juice: .pineapple)
        updateStock()
    }
    @IBAction func kiwiButton(_ sender: UIButton) {
        buttonEvent(juice: .kiwi)
        updateStock()
    }
    @IBAction func mangoButton(_ sender: UIButton) {
        buttonEvent(juice: .mango)
        updateStock()
    }
    
    func updateStock() {
        guard let strawberry = juiceMaker.fruitStore.stocks[.strawberry],
              let banana = juiceMaker.fruitStore.stocks[.banana],
              let pineapple = juiceMaker.fruitStore.stocks[.pineapple],
              let kiwi = juiceMaker.fruitStore.stocks[.kiwi],
              let mango = juiceMaker.fruitStore.stocks[.mango] else {
            return
        }
        strawberryLabel.text = "\(strawberry)"
        bananaLabel.text = "\(banana)"
        pineappleLabel.text = "\(pineapple)"
        kiwiLabel.text = "\(kiwi)"
        mangoLabel.text = "\(mango)"
    }
    
    var juiceMaker = JuiceMaker()
    
    func buttonEvent(juice: Juice) {
        do {
            try juiceMaker.makeJuice(of: juice)
        } catch StockError.outOfStock {
            print("재고 부족")
            juiceMaker.fruitStore.insufficientStock.removeAll()
        } catch {
            print("알 수 없는 에러")
        }
    }
}
