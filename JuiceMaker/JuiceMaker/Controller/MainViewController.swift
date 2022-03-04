//
//  JuiceMaker - ViewController.swift
//  Created by Doogie & Malrang.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    private let juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }
    
    @IBAction func touchToMoveManageView(_ sender: UIBarButtonItem) {
        moveToManageView()
    }
    
    @IBAction func touchToOrderJuice(_ sender: UIButton) {
        guard let menu = Menu(rawValue: sender.tag) else {
            presentBasicAlert(title: "경고", message: "알 수 없는 오류.")
            return
        }
        makeJuice(menu: menu)
        showStock()
    }
    
    private func showStock() {
        for (fruit, stock) in juiceMaker.store.fruitList {
            switch fruit {
            case .strawberry:
                self.strawberryStockLabel.text = String(stock)
            case .banana:
                self.bananaStockLabel.text = String(stock)
            case .pineapple:
                self.pineappleStockLabel.text = String(stock)
            case .kiwi:
                self.kiwiStockLabel.text = String(stock)
            case .mango:
                self.mangoStockLabel.text = String(stock)
            }
        }
    }
    
    private func moveToManageView() {
        guard let manageVC = self.storyboard?.instantiateViewController(withIdentifier: "ManageViewController") else { return }
        self.present(manageVC, animated: true, completion: nil)
    }
    
    private func makeJuice(menu: Menu) {
        do {
            try juiceMaker.checkStock(menu: menu)
            presentBasicAlert(title: nil, message: menu.orderMessage)
        } catch let error as FruitStoreError {
            switch error {
            case .invalidSelection:
                presentBasicAlert(title: "경고", message: "해당 과일이 없습니다.")
            case .outOfStock:
                presentOutOfStockAlert()
            }
        } catch { presentBasicAlert(title: "경고", message: "알 수 없는 오류.") }
    }
    
    private func presentBasicAlert(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func presentOutOfStockAlert() {
        let alert = UIAlertController(title: "경고", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: {(_) in
            self.moveToManageView()
        })
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
    }
}

