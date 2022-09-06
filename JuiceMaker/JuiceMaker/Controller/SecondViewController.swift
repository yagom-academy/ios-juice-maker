//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 서현웅 on 2022/09/05.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    var stock: [Int]?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let stock = stock {
            strawberryCount.text = String(stock[0])
            bananaCount.text = String(stock[1])
            pineappleCount.text = String(stock[2])
            kiwiCount.text = String(stock[3])
            mangoCount.text = String(stock[4])
        }
    }
    
    @IBAction func btnComplete(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func tappedCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
