//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderStrawberryJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderBananaJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderPineappleJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderMangoKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderMangoJuiceButton: OrderJuiceButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

