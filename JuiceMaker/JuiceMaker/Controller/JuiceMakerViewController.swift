//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class JuiceMakerViewController: UIViewController {
    @IBOutlet var fruitQuatityLabels: [UILabel]!
    
    @IBOutlet var needToChangeButtonsFontSize: [UIButton]!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonFontSize()
        
    }
    
    func setButtonFontSize() {
        for button in needToChangeButtonsFontSize {
            button.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFruitQuantityLabel()
    }
    
    func setFruitQuantityLabel() {
        let fruitStoreInventory = juiceMaker.fetchAllStock()
        
        fruitQuatityLabels[0].text = String(fruitStoreInventory[.strawberry] ?? 0)
        fruitQuatityLabels[1].text = String(fruitStoreInventory[.banana] ?? 0)
        fruitQuatityLabels[2].text = String(fruitStoreInventory[.pineapple] ?? 0)
        fruitQuatityLabels[3].text = String(fruitStoreInventory[.kiwi] ?? 0)
        fruitQuatityLabels[4].text = String(fruitStoreInventory[.mango] ?? 0)
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let orderedJuice = JuiceMenu(rawValue: sender.tag) else {
            return
        }
        
        if juiceMaker.make(orderedJuice) {
            showSuccessAlert(menu: orderedJuice)
        } else {
            showFailureAlert()
        }
    }
    
    func showSuccessAlert(menu: JuiceMenu) {
        let alert: UIAlertController = UIAlertController(title: nil,
                                                         message: menu.koreanName + AlertMessage.makeSuccessMessage.description,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "확인",
                                                    style: .default,
                                                    handler: { (action) in
                                                                     self.setFruitQuantityLabel()
                                                    })
        alert.addAction(okAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showFailureAlert() {
        let alert: UIAlertController = UIAlertController(title: nil,
                                                         message: AlertMessage.makeFailMessage.description,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "수정하기",
                                                    style: .default,
                                                    handler: { (action) in
                                                                   self.changeSceneOfManageStockViewController()
                                                    })
        let cancelAction: UIAlertAction = UIAlertAction(title: "나중에 하기",
                                                        style: .default,
                                                        handler: { (action) in
                                                                       self.setFruitQuantityLabel()
                                                        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func makeCurrentAllStock() -> [String] {
        var currentAllStock = [String]()
        
        for index in 0...fruitQuatityLabels.count - 1 {
            currentAllStock.append(fruitQuatityLabels[index].text ?? "0")
        }

        return currentAllStock
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination.children.first is ManageStockViewController {
            let manageStockViewController = segue.destination.children.first as? ManageStockViewController
            manageStockViewController?.deliverdAllStock = makeCurrentAllStock()
            manageStockViewController?.juiceMaker = self.juiceMaker
        }
    }
    
    func changeSceneOfManageStockViewController() {
        guard let instantiatedViewController = self.storyboard?.instantiateViewController(identifier: "manageStockViewController") else {
            return
        }
        
        let manageStockViewController = instantiatedViewController.children.first as? ManageStockViewController
        
        manageStockViewController?.deliverdAllStock = makeCurrentAllStock()
        manageStockViewController?.juiceMaker = self.juiceMaker
        
        self.present(instantiatedViewController, animated: true)
    }
}

