//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/06/15.
//

import UIKit

class StockChangeViewController: UIViewController {
    @IBOutlet var stockLabels: [StockLabel]!
    let juiceMaker = JuiceMaker.juiceMaker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateLabel() {
        StockLabel.update(numbers: stockLabels, of: juiceMaker.fruitStore)
    }
    
}
