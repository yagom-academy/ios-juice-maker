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

    @IBOutlet weak var orderStrawberryBananaButton: UIButton!
    @IBOutlet weak var orderMangoKiwiButton: UIButton!
    @IBOutlet weak var orderStrawberryButton: UIButton!
    @IBOutlet weak var orderBananaButton: UIButton!
    @IBOutlet weak var orderPineappleButton: UIButton!
    @IBOutlet weak var orderKiwiButton: UIButton!
    @IBOutlet weak var orderMangoButton: UIButton!
    
    @IBAction func orderJuiceAction(_ sender: UIButton) {
        print(sender.currentTitle!.components(separatedBy: " ")[0])
    }
}

