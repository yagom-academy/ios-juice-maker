//
//  JuiceMaker - ViewController.swift
//  Created by 수꿍, 바드. 
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
    }
    
    @IBAction func editStock(_ sender: UIBarButtonItem) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
