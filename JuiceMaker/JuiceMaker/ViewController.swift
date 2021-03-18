//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet var strawberryStock: UILabel!
    @IBOutlet var bananaStock: UILabel!
    @IBOutlet var pineappleStock: UILabel!
    @IBOutlet var kiwiStock: UILabel!
    @IBOutlet var mangoStock: UILabel!
    
    @IBAction func strawberryBananaJuiceOrder(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(StrawberryBananaJuice.self))
        strawberryStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Strawberry.self)]!)
        bananaStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Banana.self)]!)
    }
    
    @IBAction func mangoKiwiJuiceOrder(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(MangoKiwiJuice.self))
        mangoStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Mango.self)]!)
        kiwiStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)]!)
    }
    
    @IBAction func strawberryJuiceOrder(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(StrawberryJuice.self))
        strawberryStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Strawberry.self)]!)
        
    }
    
    @IBAction func bananaJuiceOrder(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(BananaJuice.self))
        bananaStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Banana.self)]!)
    }
    
    @IBAction func pineappleJuiceOrder(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(PineappleJuice.self))
        pineappleStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Pineapple.self)]!)
    }
    
    @IBAction func kiwiJuiceOrder(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(KiwiJuice.self))
        kiwiStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)]!)
    }
    
    @IBAction func mangoJuiceOrder(_ sender: UIButton) {
        juiceMaker.makeJuice(ObjectIdentifier(MangoJuice.self))
        mangoStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Mango.self)]!)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        strawberryStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Strawberry.self)]!)
        bananaStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Banana.self)]!)
        pineappleStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Pineapple.self)]!)
        kiwiStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Kiwi.self)]!)
        mangoStock.text = String(juiceMaker.fruitsStorage.fruitsStock[ObjectIdentifier(Mango.self)]!)
    }
}

