//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialStock()
    }
    
    func showInitialStock() {
        strawberryLabel.text = String(Fruit.initialValue)
        bananaLabel.text = String(Fruit.initialValue)
        pineappleLabel.text = String(Fruit.initialValue)
        kiwiLabel.text = String(Fruit.initialValue)
        mangoLabel.text = String(Fruit.initialValue)
    }

    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .strawberryBananaJuice)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .strawberryJuice)
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .bananaJuice)
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .kiwiJuice)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .mangoKiwiJuice)
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        juiceMaker.makeFruitJuice(juice: .mangoKiwiJuice)
    }
    
}

