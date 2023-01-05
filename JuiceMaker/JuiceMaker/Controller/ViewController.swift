//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker.make(juice: .strawberryBanana)
    }
    
    let csvc = ChangeStockViewController()
    
    @IBAction func ClickChangeStock(_ sender: Any) {
//        self.navigationController?.pushViewController(csvc, animated: true)
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStock") as! ChangeStockViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    
}


