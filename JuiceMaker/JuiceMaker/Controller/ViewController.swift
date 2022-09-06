//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    let juiceMaker = JuiceMaker()
    
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        
        switch sender {
        case strawberryBananaJuiceButton:
            juiceMaker.makeJuice(to: .strawberryBananaJuice)
        case mangoKiwiJuiceButton:
            juiceMaker.makeJuice(to: .mangoKiwiJuice)
        case strawberryJuiceButton:
            juiceMaker.makeJuice(to: .strawberryJuice)
        case bananaJuiceButton:
            juiceMaker.makeJuice(to: .bananaJuice)
        case pineappleJuiceButton:
            juiceMaker.makeJuice(to: .pineappleJuice)
        case kiwiJuiceButton:
            juiceMaker.makeJuice(to: .kiwiJuice)
        case mangoJuiceButton:
            juiceMaker.makeJuice(to: .mangoJuice)
        default:
            print("버튼을 다시 눌러주세요.")
        }
    }

}

