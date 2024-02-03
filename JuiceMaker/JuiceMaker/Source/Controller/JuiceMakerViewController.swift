//
//  JuiceMaker - ViewController.swift
//  Created by HAMZZI, Danny. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    
    @IBOutlet var modifiedFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawbananaJuiceButton: UIButton!
    @IBOutlet weak var mangkiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStockLabel()
    }
    
    @IBAction func orderStrawbananaJuiceButtonClicked(_ sender: UIButton) {
        orderJuice(juiceMenu: .strawberryBananaJuice)
    }
    
    @IBAction func orderMangkiJuiceButtonClicked(_ sender: UIButton) {
        orderJuice(juiceMenu: .mangoKiwiJuice)
    }
    
    @IBAction func orderStrawberryJuiceButtonClicked(_ sender: UIButton) {
        orderJuice(juiceMenu: .strawberryJuice)
    }
    
    @IBAction func orderBananaJuiceButtonClicked(_ sender: UIButton) {
        orderJuice(juiceMenu: .bananaJuice)
    }
    
    @IBAction func orderPineappleJuiceButtonClicked(_ sender: UIButton) {
        orderJuice(juiceMenu: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuiceButtonClicked(_ sender: UIButton) {
        orderJuice(juiceMenu: .kiwiJuice)
    }
    
    @IBAction func orderMangoButtonClicked(_ sender: UIButton) {
        orderJuice(juiceMenu: .mangoJuice)
    }
    
    @IBAction func modifiedFruitStockButtonClicked(_ sender: UIBarButtonItem) {
        openFruitStockViewController()
    }
    
    func orderJuice(juiceMenu: JuiceMenu) {
        let beforeStorage = FruitStore.shared.getCurrentFruitStorage()
        print("Before: \(beforeStorage)")
        do {
            let message = try juiceMaker.makeJuice(juiceMenu: juiceMenu, amount: 1)
            showAlert(title: "Success", message: message)
        } catch let error as FruitResultError {
            if error == .outOfStockError {
                showOutOfStockAlert()
            } else {
                showErrorAlert(error: error)
            }
        } catch {
            showErrorAlert(error: .unexpectedError)
        }
        let AfterStorage = FruitStore.shared.getCurrentFruitStorage()
        print("After: \(AfterStorage)")
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func showErrorAlert(error: FruitResultError) {
        let alert = UIAlertController(title: "Error", message: error.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func showOutOfStockAlert() {
        let alert = UIAlertController(title: "재고 부족", message: "재고가 부족합니다. 재고를 채우시겠습니까?", preferredStyle: .alert)
        let confirmYesAction = UIAlertAction(title: "예", style: .default) { _ in
            self.openFruitStockViewController()
        }
        let confirmNoAction = UIAlertAction(title: "아니오", style: .default)
        alert.addAction(confirmYesAction)
        alert.addAction(confirmNoAction)
        present(alert, animated: true, completion: nil)
    }
    
    func openFruitStockViewController() {
        guard let fruitStockViewController = storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") as? FruitStockViewController else {
            return
        }
        
        fruitStockViewController.modalPresentationStyle = .fullScreen
        present(fruitStockViewController, animated: true, completion: nil)
    }
    
    func showFruitStockLabel() {
        strawberryLabel.text = juiceMaker.viewFruitStock(fruitName: .strawberry)
        bananaLabel.text = juiceMaker.viewFruitStock(fruitName: .banana)
        pineappleLabel.text = juiceMaker.viewFruitStock(fruitName: .pineapple)
        kiwiLabel.text = juiceMaker.viewFruitStock(fruitName: .kiwi)
        mangoLabel.text = juiceMaker.viewFruitStock(fruitName: .mango)
    }
}

