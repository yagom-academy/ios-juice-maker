//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Method
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func orderJuice(of juice: Juice) {
        showAlert(title: "주문완료", message: "\(juice) 쥬스 나왔습니다! 맛있게 드세요!")
    }
    
    // MARK: - IBAction
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        orderJuice(of: .strawberryBanana)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        orderJuice(of: .mangoKiwi)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        orderJuice(of: .strawberry)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        orderJuice(of: .banana)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        orderJuice(of: .pineapple)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        orderJuice(of: .kiwi)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        orderJuice(of: .mango)
    }
}
