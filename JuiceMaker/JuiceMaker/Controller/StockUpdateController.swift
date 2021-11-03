//
//  StockUpdateController.swift
//  JuiceMaker
//
//  Created by 권나영 on 2021/10/28.
//

import UIKit

class StockUpdateController: UIViewController {
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var stockOfFruit: [Fruit: Int] = [:]
    
    @IBAction func tapExitButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
