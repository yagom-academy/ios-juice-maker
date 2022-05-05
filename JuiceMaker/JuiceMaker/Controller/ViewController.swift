//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stockStrawberryCount: UILabel!
    @IBOutlet weak var stockBananaCount: UILabel!
    @IBOutlet weak var stockPineappleCount: UILabel!
    @IBOutlet weak var stockKiwiCount: UILabel!
    @IBOutlet weak var stockMangoCount: UILabel!
    
    var strawberry: String = ""
    var banana: String = ""
    var pineapple: String = ""
    var kiwi: String = ""
    var mango: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.stockStrawberryCount.text = strawberry
        self.stockBananaCount.text = banana
        self.stockPineappleCount.text = pineapple
        self.stockKiwiCount.text = kiwi
        self.stockMangoCount.text = mango
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpCompleteButton(_ sender: UIButton) {
        showAlert(message: "Coming soon!")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}


