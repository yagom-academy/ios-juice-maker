//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    let juiceMaker = JuiceMaker()
    let fruitsStorage = FruitsStorage.sharedInstance
    
    @IBOutlet var strawberryStockLabel: UILabel!
    @IBOutlet var bananaStockLabel: UILabel!
    @IBOutlet var pineappleStockLabel: UILabel!
    @IBOutlet var kiwiStockLabel: UILabel!
    @IBOutlet var mangoStockLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStockText()
    }
    
    @IBAction func goToFruitsStorage(_ sender: UIButton) {
        guard let fruitsStorageVC = self.storyboard?.instantiateViewController(withIdentifier: "fruitsStorageVC") else {
            return
        }
        present(fruitsStorageVC, animated: true)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        let order = juiceMaker.makeJuice(ObjectIdentifier(StrawberryJuice.self))
        juiceOrderAlert(result: order, name: ObjectIdentifier(StrawberryJuice.self))
        updateStockText()
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        let order = juiceMaker.makeJuice(ObjectIdentifier(BananaJuice.self))
        juiceOrderAlert(result: order, name: ObjectIdentifier(BananaJuice.self))
        updateStockText()
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        let order = juiceMaker.makeJuice(ObjectIdentifier(KiwiJuice.self))
        juiceOrderAlert(result: order, name: ObjectIdentifier(StrawberryJuice.self))
        updateStockText()
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        let order = juiceMaker.makeJuice(ObjectIdentifier(PineappleJuice.self))
        juiceOrderAlert(result: order, name: ObjectIdentifier(PineappleJuice.self))
        updateStockText()
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        let order = juiceMaker.makeJuice(ObjectIdentifier(MangoJuice.self))
        juiceOrderAlert(result: order, name: ObjectIdentifier(MangoJuice.self))
        updateStockText()
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        let order = juiceMaker.makeJuice(ObjectIdentifier(StrawberryBananaJuice.self))
        juiceOrderAlert(result: order, name: ObjectIdentifier(StrawberryBananaJuice.self))
        updateStockText()
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        let order = juiceMaker.makeJuice(ObjectIdentifier(MangoKiwiJuice.self))
        juiceOrderAlert(result: order, name: ObjectIdentifier(MangoKiwiJuice.self))
        updateStockText()
    }

    func updateStockText() {
        guard let remainedStrawberryStock = fruitsStorage.fruitsStock[ObjectIdentifier(Strawberry.self)],
              let remainedBananaStock = fruitsStorage.fruitsStock[ObjectIdentifier(Banana.self)],
              let remainedKiwiStock = fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)],
              let remainedPineappleStock = fruitsStorage.fruitsStock[ObjectIdentifier(Pineapple.self)],
              let remainedMangoStock = fruitsStorage.fruitsStock[ObjectIdentifier(Mango.self)] else {
            return
        }
        strawberryStockLabel.text = String(remainedStrawberryStock)
        bananaStockLabel.text = String(remainedBananaStock)
        pineappleStockLabel.text = String(remainedPineappleStock)
        kiwiStockLabel.text = String(remainedKiwiStock)
        mangoStockLabel.text = String(remainedMangoStock)
    }
    
    func juiceOrderAlert(result: Bool, name: juiceName.Key) {
        if result {
            let alert = UIAlertController(title: nil, message: "\(juiceMaker.juicename[name]!) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert) // 쥬스 이름을 인자값으로 받아와야 하는데 쥬스 이름이 없음
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(ok)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "아니오", style: .destructive)
            
            
            let ok = UIAlertAction(title: "예", style: .default) { _ in
                guard let fruitsStorageVC = self.storyboard?.instantiateViewController(withIdentifier: "fruitsStorageVC") else {
                    return
                }
                self.present(fruitsStorageVC, animated: true)
            }
            
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    
}


