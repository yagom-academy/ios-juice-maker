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
    
    func whenButtonsTaped(menu: JuiceMaker.Menu) {
        do {
            try juiceMaker.makeJuice(menu: menu)
            let orderCompletedAlert = UIAlertController(title: nil,
                                                        message: "*** 쥬스 나왔습니다! 맛있게 드세요!",
                                                        preferredStyle: UIAlertController.Style.alert)
            present(orderCompletedAlert, animated: true, completion: nil)
        } catch juiceMakerError.outOfStock {
            print("Out of stock error")
        } catch juiceMakerError.invalidNumber {
            print("Invalid number error")
        } catch {
            print("Unexpected error: \(error)")
        }
    }
    
    @IBAction func orderStrawberryBananaJuiceButton(_ sender: Any) {
        whenButtonsTaped(menu: .strawberryBanana)
    }
    @IBAction func orderMangoKiwiJuiceButton(_ sender: Any) {
        whenButtonsTaped(menu: .mangoKiwi)
    }
    @IBAction func orderStrawberryJuice(_ sender: Any) {
        whenButtonsTaped(menu: .strawberry)
    }
    @IBAction func orderBananaJuiceButton(_ sender: Any) {
        whenButtonsTaped(menu: .banana)
    }
    @IBAction func orderPineappleJuiceButton(_ sender: Any) {
        whenButtonsTaped(menu: .pineapple)
    }
    @IBAction func orderKiwiJuiceButton(_ sender: Any) {
        whenButtonsTaped(menu: .kiwi)
    }
    @IBAction func orderMangoJuiceButton(_ sender: Any) {
        whenButtonsTaped(menu: .mango)
    }
}

