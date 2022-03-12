//
//  JuiceMaker - StockViewController.swift
//  Created by marisol, mmim.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class StockViewController: UIViewController {
    weak var delegate: StockDeliveryProtocol?
    var currentStocks: [Fruit: Int] = [:]
    
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var stockSteppers: [UIStepper]!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCurrentStock()
    }
    
    private func showCurrentStock() {
        Fruit.allCases.forEach{ fruit in
            stockLabels[fruit.rawValue].text = currentStocks[fruit]?.description
            stockSteppers[fruit.rawValue].value = Double(currentStocks[fruit] ?? 0)
        }
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        Fruit.allCases.forEach{ fruit in
            guard sender.tag == fruit.rawValue else {
                return
            }
            stockLabels[fruit.rawValue].text = Int(sender.value).description
            currentStocks[fruit] = Int(sender.value)
        }
    }
    
    @IBAction func closeButtonClicked(_ sender: UIButton) {
        delegate?.update(by: currentStocks)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
