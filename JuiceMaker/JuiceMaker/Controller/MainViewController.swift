//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var stockLabels: [StockLabel] = []
    @IBOutlet var juiceOrderButtons: [JuiceOrderButton] = []
    let juiceMaker = JuiceMaker.juiceMaker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel()
    }
    
    func orderButton() {
        JuiceOrderButton.connectJuice(to: juiceOrderButtons)
    }
    
    func updateLabel() {
        StockLabel.update(numbers: stockLabels, of: juiceMaker.fruitStore)
    }

    @IBAction func juiceOrderButton(_ sender: JuiceOrderButton) {
        guard let juice = sender.juice else { return }
        
        do {
            if try juiceMaker.checkStockPresence (juice) {
                juiceMaker.make(juice)
                print(juiceMaker.fruitStore.fruits)
                alert()
                updateLabel()
            } else {
                print("재고가 모자라요.")
            }
        } catch JuiceMakerError.invalidJuice {
            print(JuiceMakerError.invalidJuice.message)
        } catch {
            return
        }
    }
    
    @IBAction func changedStockButton(_ sender: Any) {
        guard let presentModal = storyboard?.instantiateViewController(identifier: "stockChange") else { return }
        present(presentModal, animated: true, completion: nil)
    }
}

extension MainViewController {
    func alert() {
        let alertController = UIAlertController(title: "알림", message: "재고 부족", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
