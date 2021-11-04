//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    private var juiceMaker = JuiceMaker()

    @IBOutlet var stockOfStrawberryLabel: UILabel!
    @IBOutlet var stockOfBananaLabel: UILabel!
    @IBOutlet var stockOfPineappleLabel: UILabel!
    @IBOutlet var stockOfKiwiLabel: UILabel!
    @IBOutlet var stockOfMangoLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStockLabel()
    }
    
    private func updateStockLabel() {
        let currentStock = juiceMaker.stringOfFruitStock
        for (fruit, stock) in currentStock {
            switch fruit {
            case .strawberry:
                stockOfStrawberryLabel.text = stock
            case .banana:
                stockOfBananaLabel.text = stock
            case .pineapple:
                stockOfPineappleLabel.text = stock
            case .kiwi:
                stockOfKiwiLabel.text = stock
            case .mango:
                stockOfMangoLabel.text = stock
            }
        }
    }
    
    @IBAction private func hitStrawberryBananaJuiceButton(_ sender: UIButton) {
        orderJuice(.strawberryBananaJuice)
    }
    
    @IBAction private func hitMangoKiwiJuiceButton(_ sender: UIButton) {
        orderJuice(.mangoKiwiJuice)
    }
    
    @IBAction private func hitStrawberryJuiceButton(_ sender: UIButton) {
        orderJuice(.strawberryJuice)
    }
    
    @IBAction private func hitBananaJuiceButton(_ sender: UIButton) {
        orderJuice(.bananaJuice)
    }
    
    @IBAction private func hitPineappleJuiceButton(_ sender: UIButton) {
        orderJuice(.pineappleJuice)
    }
    
    @IBAction private func hitKiwiJuiceButton(_ sender: UIButton) {
        orderJuice(.kiwiJuice)
    }
    
    @IBAction private func hitMangoJuiceButton(_ sender: UIButton) {
        orderJuice(.mangoJuice)
    }
        
    private func orderJuice(_ juice: Menu) {
        let isSuccess: Bool = juiceMaker.canMake(juice)
        
        if isSuccess {
            showAlert(isSuccess: true, message: "\(juice) 나왔습니다! 맛있게 드세요!")
            updateStockLabel()
        } else {
            showAlert(isSuccess: false, message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    private func showAlert(isSuccess: Bool, message: String) {
        let alert: UIAlertController
        
        if isSuccess {
            alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.viewDidLoad()
            }
            alert.addAction(okAction)
        } else {
            alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
            let moveEditView = UIAlertAction(title: "재고수정하기", style: .default) {_ in
                self.moveToEditViewController()
            }
            let closeAlert = UIAlertAction(title: "닫기", style: .default) {_ in
                self.viewDidLoad()
            }
            alert.addAction(moveEditView)
            alert.addAction(closeAlert)
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func hitEditButton(_ sender: UIBarButtonItem) {
        moveToEditViewController()
    }
    
    private func moveToEditViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editViewController: EditFruitStockViewController = storyboard.instantiateViewController(identifier: "EditViewController")
        let navigationController = UINavigationController(rootViewController: editViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}
