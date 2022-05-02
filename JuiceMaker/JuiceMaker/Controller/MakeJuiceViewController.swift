//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MakeJuiceViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    @IBOutlet weak var orderStrawBerryAndBananaJuiceButton: UIButton!
    @IBOutlet weak var orderStrawberryJuiceButton: UIButton!
    @IBOutlet weak var orderBananaJuiceButton: UIButton!
    @IBOutlet weak var orderPineAppleButton: UIButton!
    @IBOutlet weak var orderKiwiJuiceButton: UIButton!
    @IBOutlet weak var orderMangoJuiceButton: UIButton!
    @IBOutlet weak var orderMangoAndKiwiJuiceButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func orderButton(_ sender: UIButton) {
        switch sender {
        case orderStrawBerryAndBananaJuiceButton: break
        default:
            break
        }
    }
}

