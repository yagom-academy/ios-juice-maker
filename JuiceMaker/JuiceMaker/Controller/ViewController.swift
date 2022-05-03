//
//  JuiceMaker - ViewController.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func kiwiButton(_ sender: UIButton) {
        buttonEvent(juice: .kiwi)
        updateStock()
    }
    @IBAction func mangoButton(_ sender: UIButton) {
        buttonEvent(juice: .mango)
        updateStock()
    }
    @IBAction func pineappleButton(_ sender: UIButton) {
        buttonEvent(juice: .pineapple)
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
    
    func updateStock() {
        guard let strawberry = juiceMaker.fruitStore.stocks[.strawberry],
              let banana = juiceMaker.fruitStore.stocks[.banana],
              let kiwi = juiceMaker.fruitStore.stocks[.kiwi],
              let mango = juiceMaker.fruitStore.stocks[.mango],
              let pineapple = juiceMaker.fruitStore.stocks[.pineapple]
        else {
            return
        }
        strawberryLabel.text = "\(strawberry)"
        bananaLabel.text = "\(banana)"
        kiwiLabel.text = "\(kiwi)"
        mangoLabel.text = "\(mango)"
        pineappleLabel.text = "\(pineapple)"
    }
    
    func buttonEvent(juice: Juice) {
        do {
            try juiceMaker.makeJuice(of: juice)
            alertSuccessMakeJuice(juice: juice)
        } catch StockError.outOfStock {
            alertFailMakeJuice()
            juiceMaker.fruitStore.insufficientStock.removeAll()
        } catch StockError.defaultError {
            print("defaultError!!")
        } catch {
            print("알 수 없는 에러!!")
        }
    }
    
    func alertSuccessMakeJuice(juice: Juice) {
        let eventSuccess = UIAlertController(title: "성공!", message: "\(juice.name)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        eventSuccess.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(eventSuccess, animated: false)
    }
    
    func alertFailMakeJuice() {
        let eventFail = UIAlertController(title: "실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        eventFail.addAction(UIAlertAction(title: "예", style: .default, handler: {_ in self.performSegue(withIdentifier: "moveToFruitStock", sender: nil)}))
        eventFail.addAction(UIAlertAction(title: "아니요", style: .destructive, handler: nil))
        self.present(eventFail, animated: false)
    }
}
