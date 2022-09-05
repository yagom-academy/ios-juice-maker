//
//  JuiceMaker - ViewController.swift
//  Created by 써니쿠키, 써머캣
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var changeFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryStockLabel.text = String(validateStock(.strawberry))
        bananaStockLabel.text = String(validateStock(.banana))
        pineappleStockLabel.text = String(validateStock(.pineapple))
        kiwiStockLabel.text = String(validateStock(.kiwi))
        mangoStockLabel.text = String(validateStock(.mango))
    }
    
    func validateStock(_ fruit: Fruit) -> Int {
        guard let stock = FruitStore.sharedFruitStore.fetchStockOf(fruit) else {
            return 0
        }
        
        return stock
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        var result: Result<String, Error>
        
        switch sender {
        case strawberryBananaJuiceButton:
            result = juiceMaker.makeJuice(.strawberryBananaJuice, total: 1)
        case mangoKiwiJuiceButton:
            result = juiceMaker.makeJuice(.mangoKiwiJuice, total: 1)
        case strawberryJuiceButton:
            result = juiceMaker.makeJuice(.strawberryJuice, total: 1)
        case bananaJuiceButton:
            result = juiceMaker.makeJuice(.bananaJuice, total: 1)
        case pineappleJuiceButton:
            result = juiceMaker.makeJuice(.pineappleJuice, total: 1)
        case kiwiJuiceButton:
            result = juiceMaker.makeJuice(.kiwiJuice, total: 1)
        case mangoJuiceButton:
            result = juiceMaker.makeJuice(.mangoJuice, total: 1)
        default:
            return
        }
        
        switch result {
        case .success(let message):
            showSuccessAlert(message: message)
            viewDidLoad()
        case .failure(let error):
            showFailureAlert(message: error.errorDescription)
        }
    }
    
    func getresult() {
        
    }

    func moveToFruitStockVC() {
        guard let fruitStoreStockViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "fruitStoreStock") else { return }
        self.present(fruitStoreStockViewController, animated: true, completion: nil)
    }

    @IBAction func touchUpChangeFruitStockButton(_ sender: Any) {
        moveToFruitStockVC()
    }
    
}

