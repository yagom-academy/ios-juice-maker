//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let fruitsStorageVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "fruitsStorageVC")
    let juiceMaker = JuiceMaker()
    
    @IBOutlet var strawberryStock: UILabel!
    @IBOutlet var bananaStock: UILabel!
    @IBOutlet var pineappleStock: UILabel!
    @IBOutlet var kiwiStock: UILabel!
    @IBOutlet var mangoStock: UILabel!
    
    @IBOutlet var strawberryBananaJuice: UIButton!
    @IBOutlet var mangoKiwiJuice: UIButton!
    @IBOutlet var strawberryJuice: UIButton!
    @IBOutlet var bananaJuice: UIButton!
    @IBOutlet var pineappleJuice: UIButton!
    @IBOutlet var kiwiJuice: UIButton!
    @IBOutlet var mangoJuice: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStockText()
    }
    
    @IBAction func goToFruitsStorage(_ sender: UIButton) {
        present(fruitsStorageVC, animated: true)
    }
    
    @IBAction func juiceOrder(_ sender: UIButton) {
        var menu = ObjectIdentifier(StrawberryBananaJuice.self) // 기본값이 특정쥬스인게 이상함
        
        switch sender {
        case strawberryBananaJuice:
            menu = ObjectIdentifier(StrawberryBananaJuice.self)
        case mangoKiwiJuice:
            menu = ObjectIdentifier(MangoKiwiJuice.self)
        case strawberryJuice:
            menu = ObjectIdentifier(StrawberryJuice.self)
        case bananaJuice:
            menu = ObjectIdentifier(BananaJuice.self)
        case pineappleJuice:
            menu = ObjectIdentifier(PineappleJuice.self)
        case kiwiJuice:
            menu = ObjectIdentifier(KiwiJuice.self)
        case mangoJuice:
            menu = ObjectIdentifier(MangoJuice.self)
        default:
            return // 예외처리 해줘야함
        }
        let order = juiceMaker.makeJuice(menu)
        juiceOrderAlert(result: order)
        updateStockText()
    }

    func updateStockText() {
        strawberryStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Strawberry.self)]!)
        bananaStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Banana.self)]!)
        pineappleStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Pineapple.self)]!)
        kiwiStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)]!)
        mangoStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Mango.self)]!)
    }
    
    func juiceOrderAlert(result: Bool) {
        if result {
            let alert = UIAlertController(title: nil, message: "쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert) // 쥬스 이름을 인자값으로 받아와야 하는데 쥬스 이름이 없음
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(ok)
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "아니오", style: .destructive)
            
            
            let ok = UIAlertAction(title: "예", style: .default) { _ in
                self.present(self.fruitsStorageVC, animated: true)
            }
            
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    
}


