//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var fruitStore: FruitStore = .init(initialStock: 10)
    lazy var juiceMaker: JuiceMaker = .init(fruitStore: fruitStore)
    
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
        guard let juice: Juice = juice(orderedBy: sender) else {
            return
        }
        let result: Result<Juice, FruitStoreError> = juiceMaker.make(juice)
        switch result {
        case .success(let juice):
            updateFruitStockLabel()
            showOkayAlert("\(juice.name) \(AlertText.juiceCompletion)")
        case .failure(let fruitStoreError):
            showStockEditAlert("\(fruitStoreError.localizedDescription)")
        }
    }
    
    func juice(orderedBy button: UIButton) -> Juice? {
        switch button {
        case strawberryJuiceOrderButton:
            return .strawberryJuice
        case bananaJuiceOrderButton:
            return .bananaJuice
        case kiwiJuiceOrderButton:
            return .kiwiJuice
        case pineappleJuiceOrderButton:
            return .pineappleJuice
        case strawberryBananaMixJuiceOrderButton:
            return .strawberryBananaMixJuice
        case mangoJuiceOrderButton:
            return .mangoJuice
        case mangoKiwiMixJuiceOrderButton:
            return .mangoKiwiMixJuice
        default:
            return nil
        }
    }
    
    func showOkayAlert(_ message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertText.okay,
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showStockEditAlert(_ message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let editAction = UIAlertAction(title: AlertText.yes,
                                       style: .default) { (action) in
            self.prsentStockEditView()
        }
        let cancelAction = UIAlertAction(title: AlertText.no,
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
        if let strawberryStock = try? fruitStore.currentStock(of: .strawberry) {
            strawberryStockLabel.text = "\(strawberryStock)"
        }
        if let bananaStock = try? fruitStore.currentStock(of: .banana) {
            bananaStockLabel.text = "\(bananaStock)"
        }
        if let kiwiStock = try? fruitStore.currentStock(of: .kiwi) {
            kiwiStockLabel.text = "\(kiwiStock)"
        }
        if let pineappleStock = try? fruitStore.currentStock(of: .pineapple) {
            pineappleStockLabel.text = "\(pineappleStock)"
        }
        if let mangoStock = try? fruitStore.currentStock(of: .mango) {
            mangoStockLabel.text = "\(mangoStock)"
        }
    }
}
