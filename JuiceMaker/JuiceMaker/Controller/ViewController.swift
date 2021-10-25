//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker()
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        var juice: JuiceMaker.Juice?
        
        switch sender {
        case strawberryBananaJuiceOrderButton:
            juice = .strawberryAndBananaJuice
        case strawberryJuiceOrderButton:
            juice = .strawberryJuice
        case bananaJuiceOrderButton:
            juice = .bananaJuice
        case mangoKiwiJuiceOrderButton:
            juice = .mangoKiwiJuice
        case pineappleJuiceOrderButton:
            juice = .pineappleJuice
        case kiwiJuiceOrderButton:
            juice = .kiwiJuice
        case mangoJuiceOrderButton:
            juice = .mangoJuice
        default:
            print("메뉴에 없어요")
        }
        
        guard let orderedJuice = juice else {
            return
        }
        
        do {
            try juiceMaker.make(juice: orderedJuice)
        } catch ServiceError.notEnoughStock {
            print(ServiceError.notEnoughStock.errorDescription)
        } catch SystemError.invaildKey {
            print(SystemError.invaildKey.errorDescription)
        } catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

