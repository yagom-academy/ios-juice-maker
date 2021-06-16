//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func modifyStockButton(_ sender: Any) {
        let showModifyStockView = self.storyboard?.instantiateViewController(withIdentifier: "modifyStockViewController")
        
        showModifyStockView?.modalTransitionStyle = .coverVertical
        self.present(showModifyStockView!, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pinepappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let juiceMaker: JuiceMaker = JuiceMaker()
    
    func whenButtonsTapped(menu: JuiceMaker.Menu) {
        do {
            try juiceMaker.makeJuice(menu: menu)
            let orderCompletedAlert = UIAlertController(title: nil,
                                                        message: "\(menu.rawValue) 쥬스 나왔습니다! 맛있게 드세요!",
                                                        preferredStyle: UIAlertController.Style.alert)
            
            let confirm = UIAlertAction(title: "확인", style: .default, handler: nil)
            orderCompletedAlert.addAction(confirm)
            
            present(orderCompletedAlert, animated: true, completion: nil)
        } catch juiceMakerError.outOfStock {
            let outOfStockAlert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: UIAlertController.Style.alert)

            let yes = UIAlertAction(title: "예", style: .default, handler: {_ in let showModifyStockView = self.storyboard?.instantiateViewController(withIdentifier: "modifyStockViewController")
                                        
                                        showModifyStockView?.modalTransitionStyle = .coverVertical
                                        self.present(showModifyStockView!, animated: true, completion: nil)} )
            let no = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
            
            outOfStockAlert.addAction(yes)
            outOfStockAlert.addAction(no)
            present(outOfStockAlert, animated: true, completion: nil)

            
        } catch juiceMakerError.invalidNumber {
            print("Invalid number error")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    @IBAction func orderStrawberryBananaJuiceButton(_ sender: Any) {
        whenButtonsTapped(menu: .strawberryBanana)
    }
    @IBAction func orderMangoKiwiJuiceButton(_ sender: Any) {
        whenButtonsTapped(menu: .mangoKiwi)
    }
    @IBAction func orderStrawberryJuice(_ sender: Any) {
        whenButtonsTapped(menu: .strawberry)
    }
    @IBAction func orderBananaJuiceButton(_ sender: Any) {
        whenButtonsTapped(menu: .banana)
    }
    @IBAction func orderPineappleJuiceButton(_ sender: Any) {
        whenButtonsTapped(menu: .pineapple)
    }
    @IBAction func orderKiwiJuiceButton(_ sender: Any) {
        whenButtonsTapped(menu: .kiwi)
    }
    @IBAction func orderMangoJuiceButton(_ sender: Any) {
        whenButtonsTapped(menu: .mango)
    }
}

