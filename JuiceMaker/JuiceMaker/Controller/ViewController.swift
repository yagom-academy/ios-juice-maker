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
            try myJuiceMaker.makeStrawberryBananaJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            print("countUnderZero")
        } catch {
            
        }
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
    }
    @IBAction func mangoKiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeMangoKiwiJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            print("countUnderZero")
        } catch {
            
        }
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
    }
    @IBAction func strawberryButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeStrawberryJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            print("countUnderZeroerror")
        } catch {
            print("another Error")
        }
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
    }
    @IBAction func bananaButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeBananaJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            print("countUnderZeroerror")
        } catch {
            
        }
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
    }
    @IBAction func pineappleButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makePineappleJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            print("countUnderZeroerror")
        } catch {
            
        }
        pineappleLabel.text = String(myJuiceMaker.fruitStore.pineapple.stock)
    }
    @IBAction func kiwiButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeKiwiJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            print("countUnderZeroerror")
        } catch {
            
        }
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
    }
    @IBAction func mangoButton(_ sender: UIButton) {
        do {
            try myJuiceMaker.makeMangoJuice()
        } catch JuiceMaker.JuiceMakerError.insufficientFruit {
            print("countUnderZeroerror")
        } catch {
            
        }
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryLabel.text = String(myJuiceMaker.fruitStore.strawberry.stock)
        bananaLabel.text = String(myJuiceMaker.fruitStore.banana.stock)
        pineappleLabel.text = String(myJuiceMaker.fruitStore.pineapple.stock)
        kiwiLabel.text = String(myJuiceMaker.fruitStore.kiwi.stock)
        mangoLabel.text = String(myJuiceMaker.fruitStore.mango.stock)
    }
}
