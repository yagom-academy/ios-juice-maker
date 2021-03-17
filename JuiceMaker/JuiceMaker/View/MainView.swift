//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

//MARK: - View

class MainViewController: UIViewController {
    @IBOutlet var strawberryStock: StockLabel!
    @IBOutlet var bananaStock: StockLabel!
    @IBOutlet var pineappleStock: StockLabel!
    @IBOutlet var kiwiStock: StockLabel!
    @IBOutlet var mangoStock: StockLabel!
    
    @IBOutlet var strawBananaButton: JuiceOrderButton!
    @IBOutlet var mangoKiwiButton: JuiceOrderButton!
    @IBOutlet var strawberryButton: JuiceOrderButton!
    @IBOutlet var bananaButton: JuiceOrderButton!
    @IBOutlet var pineappleButton: JuiceOrderButton!
    @IBOutlet var kiwiButton: JuiceOrderButton!
    @IBOutlet var mangoButton: JuiceOrderButton!
}
