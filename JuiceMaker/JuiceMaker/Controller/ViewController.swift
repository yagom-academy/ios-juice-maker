//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var fruitLabelCollection: [UILabel]!
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitsStock()
    }
    
    private func showFruitsStock() {
        var index:Int = .zero
        for fruit in Fruit.allCases {
            guard let stock = FruitStore.shared.inventory[fruit] else {
                return
            }
            fruitLabelCollection[index].text = String(stock)
            index += 1
        }
    }
    
    @IBAction func makeStrawberryBananaJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func makeMangoKiwiJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func makeStrawberryJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func makeBananaJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func makePineappleJuiceButton(_ sender: UIButton) {
    }
    
    
    @IBAction func makeKiwiJuiceButton(_ sender: UIButton) {
    }
    
    @IBAction func makeMangoJuiceButton(_ sender: UIButton) {
    }
    
}
