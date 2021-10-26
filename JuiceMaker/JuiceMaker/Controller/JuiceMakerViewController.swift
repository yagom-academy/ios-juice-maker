//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {

    @IBOutlet var currentStrawberryStockLabel: UILabel!
    @IBOutlet var currentBanannaStockLabel: UILabel!
    @IBOutlet var currentPineappleStockLabel: UILabel!
    @IBOutlet var currentKiwiStockLabel: UILabel!
    @IBOutlet var currentMangoStockLabel: UILabel!
    
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fruitStore = FruitStore(fruitList: Fruit.allCases, amount: 10)
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
        // Do any additional setup after loading the view.
    }

    @IBAction func navigateToStockModificationVC(_ sender: UIBarButtonItem) {
        let stockManagerVC = storyboard?.instantiateViewController(withIdentifier: "StockManagerVC") as! StockManagerViewController
        let navigationController = UINavigationController(rootViewController: stockManagerVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func orderStrawberryBanannaJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderBanannaJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
    }
}

