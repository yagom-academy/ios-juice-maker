//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showStock()
    }
    
    func showStock() {
        strawberryStockLabel.text = "\(juiceMaker.getFruitStock(.strawberry)!)"
        bananaStockLabel.text = "\(juiceMaker.getFruitStock(.banana)!)"
        pineappleStockLabel.text = "\(juiceMaker.getFruitStock(.pineapple)!)"
        kiwiStockLabel.text = "\(juiceMaker.getFruitStock(.kiwi)!)"
        mangoStockLabel.text = "\(juiceMaker.getFruitStock(.mango)!)"
    }
    
    @IBAction func strawberrybananaJuiceOrderButton(_ sender: UIButton) {
    }
    @IBAction func mangokiwiJuiceOrderButton(_ sender: UIButton) {
    }
    @IBAction func strawberryJuiceOrderButton(_ sender: UIButton) {
    }
    @IBAction func bananaJuiceOrderButton(_ sender: UIButton) {
    }
    @IBAction func pineappleJuiceOrderButton(_ sender: UIButton) {
    }
    @IBAction func kiwiJuiceOrderButton(_ sender: UIButton) {
    }
    @IBAction func mangoJuiceOrderButton(_ sender: UIButton) {
    }
    
    
    @IBAction func fixStockButton(_ sender: UIBarButtonItem) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "FixStockViewControllerID") else { return }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
