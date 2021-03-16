//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/11.
//

import UIKit

class SecondViewController: UIViewController {
    let juiceMaker = JuiceMaker.shared
    @IBOutlet var fruitStockLabels = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        update(labels: fruitStockLabels, by: juiceMaker.stock)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
