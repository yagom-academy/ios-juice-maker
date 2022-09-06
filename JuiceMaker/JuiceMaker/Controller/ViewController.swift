//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var juiceMaker: JuiceMaker = .init(fruitStore: .init(initialStock: 10))
    
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryBananaMixJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiMixJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabel()
    }
    
    @IBAction func touchUpEditStockButton(_ sender: UIBarButtonItem) {
        prsentStockEditView()
    }
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        let juice: Juice
        switch sender {
        case strawberryJuiceOrderButton:
            juice = .strawberryJuice
        case bananaJuiceOrderButton:
            juice = .bananaJuice
        case kiwiJuiceOrderButton:
            juice = .kiwiJuice
        case pineappleJuiceOrderButton:
            juice = .pineappleJuice
        case strawberryBananaMixJuiceOrderButton:
            juice = .strawberryBananaMixJuice
        case mangoJuiceOrderButton:
            juice = .mangoJuice
        case mangoKiwiMixJuiceOrderButton:
            juice = .mangoKiwiMixJuice
        default:
            return
        }
        let result: Result<Juice,FruitStoreError> = juiceMaker.make(juice)
        switch result {
        case .success:
            updateFruitStockLabel()
            showOKAlert("\(juice.name) 나왔습니다! 맛있게 드세요!")
        case .failure:
            showEditAlert("재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func showOKAlert(_ message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showEditAlert(_ message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let editAction = UIAlertAction(title: "예",
                                       style: .default) { (action) in
            self.prsentStockEditView()
        }
        let cancelAction = UIAlertAction(title: "아니오",
                                         style: .default)
        alert.addAction(editAction)
        alert.addAction(cancelAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func prsentStockEditView() {
        guard let stockEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockEditViewController") as? StockEditViewController else {
            return
        }
        stockEditViewController.modalTransitionStyle = .coverVertical
        stockEditViewController.modalPresentationStyle = .fullScreen
        self.present(stockEditViewController,
                     animated: true,
                     completion: nil)
    }
    
    func updateFruitStockLabel() {
        if let strawberryStock = try? juiceMaker.fruitStore.currentStock(of: .strawberry) {
            strawberryStockLabel.text = "\(strawberryStock)"
        }
        if let bananaStock = try? juiceMaker.fruitStore.currentStock(of: .banana) {
            bananaStockLabel.text = "\(bananaStock)"
        }
        if let kiwiStock = try? juiceMaker.fruitStore.currentStock(of: .kiwi) {
            kiwiStockLabel.text = "\(kiwiStock)"
        }
        if let pineappleStock = try? juiceMaker.fruitStore.currentStock(of: .pineapple) {
            pineappleStockLabel.text = "\(pineappleStock)"
        }
        if let mangoStock = try? juiceMaker.fruitStore.currentStock(of: .mango) {
            mangoStockLabel.text = "\(mangoStock)"
        }
    }
}
