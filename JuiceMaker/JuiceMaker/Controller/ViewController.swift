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
        do {
            try myJuiceMaker.strawberryBananaJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZero")
        } catch {
            
        }
        strawberryLabel.text = String(myJuiceMaker.strawberry.count)
        bananaLabel.text = String(myJuiceMaker.banana.count)
    }
    @IBAction func mangoKiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.mangoKiwiJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZero")
        } catch {
            
        }
        kiwiLabel.text = String(myJuiceMaker.kiwi.count)
        mangoLabel.text = String(myJuiceMaker.mango.count)
    }
    @IBAction func strawberryButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.strawberryJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            print("another Error")
        }
        strawberryLabel.text = String(myJuiceMaker.strawberry.count)
    }
    @IBAction func bananaButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.bananaJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
        bananaLabel.text = String(myJuiceMaker.banana.count)
    }
    @IBAction func pineappleButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.pineappleJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
        pineappleLabel.text = String(myJuiceMaker.pineapple.count)
    }
    @IBAction func kiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.kiwiJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
        kiwiLabel.text = String(myJuiceMaker.kiwi.count)
    }
    @IBAction func mangoButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.mangoJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
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
