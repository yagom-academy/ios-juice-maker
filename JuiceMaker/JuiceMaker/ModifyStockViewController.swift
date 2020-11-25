//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/22.
//

import UIKit

class ModifyStockViewController: UIViewController {
    private var juiceMaker = JuiceMaker()
    private var fruitSymbol = ["🍓", "🍌", "🍍", "🥝", "🥭"]
    @IBOutlet var fruitSymbolLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFruitSymbols()
    }
    
    @IBAction func tappedCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension ModifyStockViewController {
    private func initializeFruitSymbols() {
        for fruitIndex in 0..<fruitSymbolLabels.count {
            fruitSymbolLabels[fruitIndex].text = fruitSymbol[fruitIndex]
        }
    }
}
