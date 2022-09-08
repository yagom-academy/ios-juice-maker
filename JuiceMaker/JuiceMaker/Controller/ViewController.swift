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
        setNavigationBar()
        settingFruitStockLabel()
    }
    
    @IBAction func modifyStockButtonTapped(_ sender: Any) {
        guard let modifyStockNC = storyboard?.instantiateViewController(withIdentifier: "ToModifyStockNavi") as? UINavigationController else {
            return
        }
        
        present(modifyStockNC, animated: true, completion: nil)
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard var orderedJuice = sender.currentTitle else {
            return
        }
        
        orderedJuice = orderedJuice.replacingOccurrences(of: " 주문", with: "")
        
        guard let juice = Juice(rawValue: orderedJuice) else {
            return
        }
                
        let isMadeJuice =  juiceMaker.manufactureJuice(menu: juice)
        
        guard isMadeJuice else {
            showFailedAlert(message: ConstantSentence.failedAlertMent)
            return
        }
        
        showSuccessAlert(message: juice.rawValue + ConstantSentence.successAlertMent)
        settingFruitStockLabel()
    }

    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default)
        alert.addAction(confirmAction)
        self.present(alert, animated: true)
    }
    
    func showFailedAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default) { _ in
            guard let modifyStockVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyVC") as? ModifyStockViewController else {
                return
            }
            
            self.present(modifyStockVC, animated: true, completion: nil)
        }
        
        let cancleAction = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true)
    }
    
    func setNavigationBar() {
        self.title = ConstantSentence.mainTitle
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
