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
        showAlert(of: .strawBerry)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        showAlert(of: .banana)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        showAlert(of: .pineApple)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        showAlert(of: .kiwi)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        showAlert(of: .mango)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        showAlert(of: .strawBerryBanana)
    }
    
    @IBAction func orderMangoKiwi(_ sender: UIButton) {
        showAlert(of: .mangoKiwi)
    }
    
    func showAlert(of juice: Juice) {
        if juiceMaker.makeJuice(of: juice) {
            let alert = UIAlertController(title: "제조 완료", message: "\(juice.rawValue)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "재고 부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            let ok = UIAlertAction(title: "재고수정", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
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
