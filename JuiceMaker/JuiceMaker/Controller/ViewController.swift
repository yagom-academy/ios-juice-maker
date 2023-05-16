//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet var strawberryJuiceButton: UIButton!
    @IBOutlet var bananaJuiceButton: UIButton!
    @IBOutlet var pineappleJuiceButton: UIButton!
    @IBOutlet var kiwiJuiceButton: UIButton!
    @IBOutlet var mangoJuiceButton: UIButton!
    @IBOutlet var strawberryBananaJuiceButton: UIButton!
    @IBOutlet var mangoKiwiJuiceButton: UIButton!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func takeOrderStrawberryJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.strawberryJuice)
    }
    @IBAction func takeOrderBananaJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.bananaJuice)
    }
    @IBAction func takeOrderPineappleJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.pineappleJuice)
    }
    @IBAction func takeOrderKiwiJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.kiwiJuice)
    }
    @IBAction func takeOrderMangoJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.mangoJuice)
    }
    @IBAction func takeOrderStrawberryBananaJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.strawberryBananaJuice)
    }
    @IBAction func takeOrderMangoKiwiJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.mangoKiwiJuice)
    }
    
    
}

