//
//  JuiceMaker - ViewController.swift
//  Created by Mene, Dragon.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class HomeViewController: UIViewController {
    
    let juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        if juiceMaker.makeJuice(of: .strawBerry) {
            let alret = UIAlertController(title: "제조 완료", message: "\(Juice.strawBerry.rawValue)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alret.addAction(ok)
            present(alret, animated: true, completion: nil)
        } else {
            let alret = UIAlertController(title: "재고 부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "재고수정", style: .default, handler: nil)
            let cancle = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            alret.addAction(cancle)
            alret.addAction(ok)
            present(alret, animated: true, completion: nil)
        }
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        if juiceMaker.makeJuice(of: .banana) {
            let alret = UIAlertController(title: "제조 완료", message: "\(Juice.banana.rawValue)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alret.addAction(ok)
            present(alret, animated: true, completion: nil)
        } else {
            let alret = UIAlertController(title: "재고 부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "재고수정", style: .default, handler: nil)
            let cancle = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            alret.addAction(cancle)
            alret.addAction(ok)
            present(alret, animated: true, completion: nil)
        }
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderMangoKiwi(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let strawberryAmount = juiceMaker.checkStock(of: .strawBerry) else { return }
        guard let bananaAmount = juiceMaker.checkStock(of: .banana) else { return }
        guard let pineappleAmount = juiceMaker.checkStock(of: .pineApple) else { return }
        guard let kiwiAmount = juiceMaker.checkStock(of: .kiwi) else { return }
        guard let mangoAmount = juiceMaker.checkStock(of: .mango) else { return }
        
        strawberryStockLabel.text = strawberryAmount
        bananaStockLabel.text = bananaAmount
        pineappleStockLabel.text = pineappleAmount
        kiwiStockLabel.text = kiwiAmount
        mangoStockLabel.text = mangoAmount
    }


}

