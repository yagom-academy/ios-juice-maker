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

    override func viewDidLoad() {
        super.viewDidLoad()
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
}
