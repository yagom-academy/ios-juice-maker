//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var modifyStockButton: UIBarButtonItem!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func modifyStockButtonTapped(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") as? ModifyStockViewController else {
            return
        }
        vc.modalPresentationStyle = .pageSheet
        
        self.present(vc, animated: true)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(juiceMenu: MenuList.strawberryJuice)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(juiceMenu: MenuList.strawberryJuice)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(juiceMenu: MenuList.strawberryBananaJuice)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(juiceMenu: MenuList.pineappleJuice)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(juiceMenu: MenuList.mangoJuice)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(juiceMenu: MenuList.kiwiJuice)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeJuice(juiceMenu: MenuList.mangoKiwiJuice)
    }
    
    func alertSufficientStock(juiceName: String) {
        let alert = UIAlertController(title: "알림", message: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(confirm)
        
        present(alert, animated: true, completion: nil)
    }
    
    func alertInsufficientStock() {
        let alert = UIAlertController(title: "알림", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "예", style: .default)  { _ in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") as? ModifyStockViewController else {
                return
            }
            vc.modalPresentationStyle = .pageSheet
            
            self.present(vc, animated: true)
        }
        
        let close = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(confirm)
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
}
