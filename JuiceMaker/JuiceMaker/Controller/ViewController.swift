//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateInventory()
    }
    
    func updateInventory() {
        let errorValue = -1
        strawberryLabel.text = "\(FruitStore.shared.fruitsInventory[.strawberry] ?? errorValue)"
        bananaLabel.text = "\(FruitStore.shared.fruitsInventory[.banana] ?? errorValue)"
        pineappleLabel.text = "\(FruitStore.shared.fruitsInventory[.pineapple] ?? errorValue)"
        kiwiLabel.text = "\(FruitStore.shared.fruitsInventory[.kiwi] ?? errorValue)"
        mangoLabel.text = "\(FruitStore.shared.fruitsInventory[.mango] ?? errorValue)"
    }
    
    @IBAction func touchUpStrawberryBananaJuice(_ sender: UIButton) {
        print("딸바쥬스")
    }
    
    @IBAction func touchUpMangoKiwiJuice(_ sender: UIButton) {
        print("망고키위쥬스")
    }
    
    @IBAction func touchUpStrawberryJuice(_ sender: UIButton) {
        print("딸기쥬스")
    }
    
    @IBAction func touchUpBananaJuice(_ sender: UIButton) {
        print("바나나쥬스")
    }
    
    @IBAction func touchUpKiwiJuice(_ sender: UIButton) {
        print("키위쥬스")
    }
    
    @IBAction func touchUpPineappleJuice(_ sender: UIButton) {
        print("파인애플쥬스")
    }
    
    @IBAction func touchUpMangoJuice(_ sender: UIButton) {
        print("망고쥬스")
    }

}

