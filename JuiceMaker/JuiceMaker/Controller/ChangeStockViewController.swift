//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/03/03.
//

import UIKit

class ChangeStockViewController: UIViewController {
    var fruitsNum: [String] = []
    @IBOutlet var fruitsCollection: [UILabel]!
    
    func showFruitsStock() {
        var fruitIndex = 0
        for fruitLabel in fruitsCollection {
            fruitLabel.text = fruitsNum[fruitIndex]
            fruitIndex += 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitsStock()
    }
    
    @IBAction func closedButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
