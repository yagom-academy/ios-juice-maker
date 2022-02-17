//
//  MainViewController - ViewController.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    let fruitStore = FruitStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: Any) {
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: Any) {
    }
    
    @IBAction func orderStrawberryJuice(_ sender: Any) {
    }
    
    @IBAction func orderBananaJuice(_ sender: Any) {
    }
    
    @IBAction func orderPineappleJuice(_ sender: Any) {
    }
    
    @IBAction func orderKiwiJuice(_ sender: Any) {
    }
    
    @IBAction func orderMangoJuice(_ sender: Any) {
    }
}

