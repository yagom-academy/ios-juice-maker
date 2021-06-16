//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func modifyStockButton(_ sender: Any) {
        let showModifyStockView = self.storyboard?.instantiateViewController(withIdentifier: "modifyStockViewController")
        
        showModifyStockView?.modalTransitionStyle = .coverVertical
        self.present(showModifyStockView!, animated: true, completion: nil)

    }
    

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pinepappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    
    @IBAction func orderStrawberryBananaJuiceButton(_ sender: Any) {
    }
    @IBAction func orderMangoKiwiJuiceButton(_ sender: Any) {
    }
    @IBAction func orderStrawberryJuice(_ sender: Any) {
    }
    
    @IBAction func orderBananaJuiceButton(_ sender: Any) {
    }
    
    @IBAction func orderPineappleJuiceButton(_ sender: Any) {
    }
    
    @IBAction func orderKiwiJuiceButton(_ sender: Any) {
    }
    
    @IBAction func orderMangoJuiceButton(_ sender: Any) {
    }
}

