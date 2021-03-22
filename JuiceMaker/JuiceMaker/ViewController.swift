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
        showFruitsStock()
    }
    
    @IBAction func goToFruitsStorage(_ sender: UIButton) {
        guard let fruitsStorageVC = self.storyboard?.instantiateViewController(withIdentifier: "fruitsStorageVC") else {
            return
        }
        fruitsStorageVC.modalPresentationStyle = .fullScreen
        present(fruitsStorageVC, animated: true)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(StrawberryJuice.self), completion: juiceOrderAlert(result:juice:))
        updateFruitsStock(ObjectIdentifier(StrawberryJuice.self))
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(BananaJuice.self), completion: juiceOrderAlert(result:juice:))
        updateFruitsStock(ObjectIdentifier(BananaJuice.self))
    }

    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(KiwiJuice.self), completion: juiceOrderAlert(result:juice:))
        updateFruitsStock(ObjectIdentifier(KiwiJuice.self))
    }

    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(PineappleJuice.self), completion: juiceOrderAlert(result:juice:))
        updateFruitsStock(ObjectIdentifier(PineappleJuice.self))
    }

    @IBAction func orderMangoJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(MangoJuice.self), completion: juiceOrderAlert(result:juice:))
        updateFruitsStock(ObjectIdentifier(MangoJuice.self))
    }

    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(StrawberryBananaJuice.self), completion: juiceOrderAlert(result:juice:))
        updateFruitsStock(ObjectIdentifier(StrawberryBananaJuice.self))
    }

    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(MangoKiwiJuice.self), completion: juiceOrderAlert(result:juice:))
        updateFruitsStock(ObjectIdentifier(MangoKiwiJuice.self))
    }
    
    func updateFruitsStock(_ juice: juiceRecipe.Key) {
        let somedict = [ObjectIdentifier(Strawberry.self) : self.strawberryStockLabel,
                        ObjectIdentifier(Banana.self) : self.bananaStockLabel,
                        ObjectIdentifier(Pineapple.self) : self.pineappleStockLabel,
                        ObjectIdentifier(Kiwi.self) : self.kiwiStockLabel,
                        ObjectIdentifier(Mango.self) : self.mangoStockLabel]
        
        for index in juiceMaker.recipes[juice]! {
            somedict[index.stock]!!.text = String(fruitsStorage.fruitsStock[index.stock]!)
        }
    }

    func showFruitsStock() {
        strawberryStockLabel.text = String(fruitsStorage.fruitsStock[ObjectIdentifier(Strawberry.self)] ?? 0)
        bananaStockLabel.text = String(fruitsStorage.fruitsStock[ObjectIdentifier(Banana.self)] ?? 0)
        pineappleStockLabel.text = String(fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)] ?? 0)
        kiwiStockLabel.text = String(fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)] ?? 0)
        mangoStockLabel.text = String(fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)] ?? 0)
    }
    
    func juiceOrderAlert(result: Bool, juice: juiceName.Key) {
        if result {
            let alert = UIAlertController(title: nil, message: "\(juiceMaker.juicename[juice]!) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
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


