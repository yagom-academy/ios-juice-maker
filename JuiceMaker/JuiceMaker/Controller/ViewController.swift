//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker.make(juice: .strawberryBanana)
        juiceMaker.make(juice: .strawberryBanana)
        juiceMaker.make(juice: .strawberryBanana)
    }
    
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineApple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    @IBAction func ClickChangeStock(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStock") as! ChangeStockViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func order(_ sender: UIButton) {
        
    }
//    @IBAction func order(_ sender: UIButton) {
//
//    }
//    @IBAction func order(_ sender: UIButton) {
//
//    }
//    @IBAction func order(_ sender: UIButton) {
//
//    }
//    @IBAction func order(_ sender: UIButton) {
//
//    }
//    @IBAction func order(_ sender: UIButton) {
//
//    }
//    @IBAction func order(_ sender: UIButton) {
//
//    }
}


