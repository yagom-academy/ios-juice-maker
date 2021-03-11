//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var strawberryStock :UILabel!
    @IBOutlet weak var bananaStock :UILabel!
    @IBOutlet weak var pineappleStock :UILabel!
    @IBOutlet weak var kiwiStock :UILabel!
    @IBOutlet weak var mangoStock :UILabel!
    
    @IBOutlet weak var strawBananaButton: UIButton!
    
    @IBOutlet weak var mangoKiwiButton: UIButton!
    
    @IBOutlet weak var strawberryButton: UIButton!
    
    @IBOutlet weak var bananaButton: UIButton!
    
    @IBOutlet weak var pineappleButton: UIButton!
    
    @IBOutlet weak var kiwiButton: UIButton!
    
    @IBOutlet weak var mangoButton: UIButton!
    
    
    @IBAction func touchUpJuiceBUtton(_ sender: Any) {
        
    }
}
