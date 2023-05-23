//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    private var delegate: Stock?
    let juiceMaker = JuiceMaker()
    
    @IBOutlet var fruitStockLabels: [UILabel]!
    @IBOutlet var orderButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let modifiedFruitStocks = delegate?.getStock() {
            juiceMaker.fruitStore.fruitInventory = modifiedFruitStocks
        }
        delegate = nil
        updateFruitStockLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let modifyStockViewController = segue.destination as? ModifyStockViewController else {
            return
        }
        delegate = modifyStockViewController
        delegate?.setStock(stocks: juiceMaker.fruitStore.fruitInventory)
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
            showAlert(message: "\(juice)나왔습니다. 맛있게 드세요!",
                      actions: UIAlertAction(title: "닫기", style: .cancel))
        } catch JuiceMakerError.outOfFruitStock {
            showAlert(message: "재료가 모자라요. 재고를 수정할까요?",
                      actions: UIAlertAction(title: "예", style: .default) {
                                action in self.presentModifyStockView() },
                      UIAlertAction(title: "아니오", style: .default))
        } catch {
            print("unknown")
        }
    }
    
    func showAlert(message: String, actions: UIAlertAction...) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func presentModifyStockView() {
        self.performSegue(withIdentifier: "modifyStockViewSegue", sender: nil)
    }
}
