//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        settingFruitStockLabel()
    }
    
    @IBAction func toModifyStockView(_ sender: Any) {
        guard let modifyStockVC = storyboard?.instantiateViewController(withIdentifier: "ModifyVC") as? ModifyStockViewController else {
            return
        }

        present(modifyStockVC, animated: true, completion: nil)
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard var orderedJuice = sender.currentTitle else {
            return
        }
        
        orderedJuice = orderedJuice.replacingOccurrences(of: " 주문", with: "")
    }

    func setNavigation() {
        self.title = "맛있는 주스를 만들어 드려요!"
        self.navigationController?.navigationBar.backgroundColor = .lightGray
    }
    
    func settingFruitStockLabel() {
        let fruitStore = juiceMaker.fruitStore
        self.strawberryStockLabel.text = String(fruitStore.bringValidFruitStock(.strawberry))
        self.bananaStockLabel.text = String(fruitStore.bringValidFruitStock(.banana))
        self.pineappleStockLabel.text = String(fruitStore.bringValidFruitStock(.pineapple))
        self.kiwiStockLabel.text = String(fruitStore.bringValidFruitStock(.kiwi))
        self.mangoStockLabel.text = String(fruitStore.bringValidFruitStock(.mango))
    }
}

