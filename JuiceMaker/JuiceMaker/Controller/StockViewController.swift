//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/17.
//

import Foundation
import UIKit

extension StockViewController {
    @IBAction func touchUpStepper(_ sender: UIStepper) {
        strawberryStock.text = Int(sender.value).description
        print(sender.description)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
