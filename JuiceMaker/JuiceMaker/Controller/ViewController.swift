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
        
        let fruitLabel: [UILabel: Fruit] = [
            strawberryStockLabel: .strawberry,
            bananaStockLabel: .banana,
            pineappleStockLabel: .pineapple,
            kiwiStockLabel: .kiwi,
            mangoStockLabel: .mango,
        ]
        
        for (label, fruit) in fruitLabel {
            label.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
        }
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        let juiceButton: [UIButton: Juice] = [
            strawberryBananaJuiceButton: .strawberryBananaJuice,
            mangoKiwiJuiceButton: .mangoKiwiJuice,
            strawberryJuiceButton: .strawberryJuice,
            bananaJuiceButton: .bananaJuice,
            pineappleJuiceButton: .pineappleJuice,
            kiwiJuiceButton: .kiwiJuice,
            mangoJuiceButton: .mangoJuice,
        ]
        
        guard let juice = juiceButton[sender] else { return }
        
        let result = juiceMaker.makeJuice(juice, total: 1)
        
        switch result {
        case .success(let message):
            showSuccessAlert(message: message)
            viewDidLoad()
        case .failure(let error):
            guard let juiceMakerError = error as? JuiceMakerError else {
                return showFailureAlert(message: error.localizedDescription)
            }
            showFailureAlert(message: juiceMakerError.errorDescription)
        }
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "예", style: .default, handler : nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showFailureAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            self.moveToFruitStockVC()
        }
        
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(noAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func moveToFruitStockVC() {
        guard let fruitStoreStockViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "fruitStoreStock") else { return }
        self.present(fruitStoreStockViewController, animated: true, completion: nil)
    }
    
    @IBAction func touchUpChangeFruitStockButton(_ sender: UIBarButtonItem) {
        moveToFruitStockVC()
    }
}

