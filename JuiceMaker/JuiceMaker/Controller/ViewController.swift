//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let myJuiceMaker = JuiceMaker()
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBAction func strawberryBananaButton(_ sender: UIButton) {
        myJuiceMaker.strawberryBananaJuice()
        strawberryLabel.text = String(myJuiceMaker.strawberry.count)
        bananaLabel.text = String(myJuiceMaker.banana.count)
    }
    @IBAction func mangoKiwiButton(_ sender: UIButton) {
        myJuiceMaker.mangoKiwiJuice()
        kiwiLabel.text = String(myJuiceMaker.kiwi.count)
        mangoLabel.text = String(myJuiceMaker.mango.count)
    }
    @IBAction func strawberryButton(_ sender: UIButton) {
        myJuiceMaker.strawberryJuice()
        strawberryLabel.text = String(myJuiceMaker.strawberry.count)
    }
    @IBAction func bananaButton(_ sender: UIButton) {
        myJuiceMaker.bananJuice()
        bananaLabel.text = String(myJuiceMaker.banana.count)
    }
    @IBAction func pineappleButton(_ sender: UIButton) {
        myJuiceMaker.pineappleJuice()
        pineappleLabel.text = String(myJuiceMaker.pineapple.count)
    }
    @IBAction func kiwiButton(_ sender: UIButton) {
        myJuiceMaker.kiwiJuice()
        kiwiLabel.text = String(myJuiceMaker.kiwi.count)
    }
    @IBAction func mangoButton(_ sender: UIButton) {
        myJuiceMaker.mangoJuice()
        mangoLabel.text = String(myJuiceMaker.mango.count)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = String(myJuiceMaker.strawberry.count)
        bananaLabel.text = String(myJuiceMaker.banana.count)
        pineappleLabel.text = String(myJuiceMaker.pineapple.count)
        kiwiLabel.text = String(myJuiceMaker.kiwi.count)
        mangoLabel.text = String(myJuiceMaker.mango.count)
    }
}
