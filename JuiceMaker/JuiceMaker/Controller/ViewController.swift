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

    @IBAction func didTabStrawberryJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.strawberryJuice)
    }
    @IBAction func didTabBananaJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.bananaJuice)
    }
    @IBAction func didTabPineappleJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.pineappleJuice)
    }
    @IBAction func didTabKiwiJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.kiwiJuice)
    }
    @IBAction func didTabMangoJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.mangoJuice)
    }
    @IBAction func didTabStrawberryBananaJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.strawberryBananaJuice)
    }
    @IBAction func didTabMangoKiwiJuiceButton(_ sender: UIButton) {
        juiceMaker.takeOrder(.mangoKiwiJuice)
    }
    
    
}

