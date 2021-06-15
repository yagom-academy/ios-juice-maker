//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var stockLabels: [StockLabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        updateLabel()
    }
    
    func updateLabel() {
        do {
            try StockLabel.update(numbers: stockLabels, of: FruitStore.stock)
        } catch {
            print(JuiceMakerError.invalidSelection.message)
        }
    }

    @IBAction func changedStockButton(_ sender: Any) {
        guard let presentModal = storyboard?.instantiateViewController(identifier: "stockChange") else { return }
        present(presentModal, animated: true, completion: nil)
    }
}

