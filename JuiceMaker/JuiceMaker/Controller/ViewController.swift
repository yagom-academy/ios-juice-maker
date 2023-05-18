//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var orderButtons: [UIButton]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFruitStockLabel()
        
    }
    
    @IBAction func touchUpOrderButton(_ sender: UIButton) {
        if let buttonIndex = orderButtons.firstIndex(of: sender){
            order(juice: Juice.allCases[buttonIndex])
        }
        
        updateFruitStockLabel()
    }
    
    func updateFruitStockLabel() {
        for fruitStockLabel in fruitStockLabels {
            fruitStockLabel.text = String(juiceMaker.fruitStore.fruitInventory[fruitStockLabel.tag])
        }
    }
    
    func order(juice: Juice) {
        do {
            try juiceMaker.blendFruitJuice(menu: juice)
            showSuccessAlert(message: "\(juice)나왔습니다. 맛있게 드세요!")
        } catch JuiceMakerError.outOfFruitStock {
            showFailureAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        } catch {
            print("unknown")
        }
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let successAction = UIAlertAction(title: "닫기", style: .cancel)
        
        alert.addAction(successAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailureAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let addAction = UIAlertAction(title: "예", style: .default) { (action) in
            self.presentModifyStockView()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func presentModifyStockView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "ModifyStockViewController")
        
        self.present(nextViewController, animated: true, completion: nil)
    }
}

