//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    private var juiceMaker = JuiceMaker.shared
    
    @IBOutlet private weak var strawberryLabel: JuiceLabel!
    @IBOutlet private weak var bananaLabel: JuiceLabel!
    @IBOutlet private weak var pineappleLabel: JuiceLabel!
    @IBOutlet private weak var mangoLabel: JuiceLabel!
    @IBOutlet private weak var kiwiLabel: JuiceLabel!
    
    @IBOutlet private weak var strawberryButton: JuiceButton!
    @IBOutlet private weak var bananaButton: JuiceButton!
    @IBOutlet private weak var pineappleButton: JuiceButton!
    @IBOutlet private weak var kiwiButton: JuiceButton!
    @IBOutlet private weak var mangoButton: JuiceButton!
    @IBOutlet private weak var mangoKiwiButton: JuiceButton!
    @IBOutlet private weak var strawberyBananaButton: JuiceButton!
    
    // MARK: - ViewLife Cycle
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        initLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateLabel(_ :)),
                                               name: Notification.Name(rawValue: "changeFruitAmount"),
                                               object: nil)
    }
    
    // MARK: - Action
    
    @IBAction func touchUpJuiceOrderButton(_ sender: Any) {
        let orderButton = sender as! JuiceButton
        let selectedFruit = Juices(rawValue: orderButton.currentTitle!)
        do {
            try juiceMaker.make(order: selectedFruit!)
        } catch {
            lakeStockAlert(JuiceMakerError.lackStock)
        }
        orderSuccessAlert(selectedFruit!)
    }
    
    // MARK: - Alert
    
    private func lakeStockAlert(_ error: Error) {
        var errorMessgae: String?
        if let juiceError = error as? JuiceMakerError {
            errorMessgae = juiceError.localizedDescription
        } else {
            errorMessgae = JuiceMakerError.unknown.localizedDescription
        }
        let failAlert = UIAlertController(title: nil , message: errorMessgae, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아니오", style: .default)
        let stockSettingAction = UIAlertAction(title: "예", style: .cancel) { action in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerViewController") as? StockManagerViewController else {
                return
            }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: true)
        }
        failAlert.addAction(stockSettingAction)
        failAlert.addAction(cancel)
        present(failAlert, animated: true, completion: nil)
    }

    private func orderSuccessAlert(_ kindJuice: Juices) {
        let alert = UIAlertController(title: "주문 확인", message: "\(kindJuice) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Update Data
    
     @objc private func updateLabel(_ notification: Notification) throws {
        switch notification.object! {
        case Fruits.strawberry :
            strawberryLabel.text = juiceMaker.currentFruit(fruit: .strawberry)
        case Fruits.banana :
            bananaLabel.text = juiceMaker.currentFruit(fruit: .banana)
        case Fruits.pineapple :
            pineappleLabel.text = juiceMaker.currentFruit(fruit: .pineapple)
        case Fruits.kiwi :
            kiwiLabel.text = juiceMaker.currentFruit(fruit: .kiwi)
        case Fruits.mango :
            mangoLabel.text = juiceMaker.currentFruit(fruit: .mango)
        default:
            return
        }
    }
    
    private func initLabel() {
        strawberryLabel.text = juiceMaker.currentFruit(fruit: .strawberry)
        bananaLabel.text = juiceMaker.currentFruit(fruit: .banana)
        pineappleLabel.text = juiceMaker.currentFruit(fruit: .pineapple)
        kiwiLabel.text = juiceMaker.currentFruit(fruit: .kiwi)
        mangoLabel.text = juiceMaker.currentFruit(fruit: .mango)
    }
}
