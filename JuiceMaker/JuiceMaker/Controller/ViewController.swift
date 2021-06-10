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
        strawberryLabel.text = String(myJuiceMaker.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.banana.stock)
    }
    @IBAction func mangoKiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.mangoKiwiJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZero")
        } catch {
            
        }
        kiwiLabel.text = String(myJuiceMaker.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.mango.stock)
    }
    @IBAction func strawberryButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.strawberryJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            print("another Error")
        }
        strawberryLabel.text = String(myJuiceMaker.strawberry.stock)
    }
    @IBAction func bananaButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.bananaJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
        bananaLabel.text = String(myJuiceMaker.banana.stock)
    }
    @IBAction func pineappleButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.pineappleJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
        pineappleLabel.text = String(myJuiceMaker.pineapple.stock)
    }
    @IBAction func kiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.kiwiJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
        kiwiLabel.text = String(myJuiceMaker.kiwi.stock)
    }
    @IBAction func mangoButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.mangoJuice()
        } catch JuiceMaker.JuiceMakerError.countUnderZero {
            print("countUnderZeroerror")
        } catch {
            
        }
        mangoLabel.text = String(myJuiceMaker.mango.stock)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = String(myJuiceMaker.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.banana.stock)
        pineappleLabel.text = String(myJuiceMaker.pineapple.stock)
        kiwiLabel.text = String(myJuiceMaker.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.mango.stock)
    }
}
