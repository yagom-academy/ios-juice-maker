//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    
    @IBOutlet private weak var stockChangeButton: UIBarButtonItem!
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureStockLabel()
    }
    
    func configureStockLabel() {
        let fruitInventory = juiceMaker.readFruitInventory()
        
        guard let strawberryStock = fruitInventory[.strawberry],
              let bananaStock = fruitInventory[.banana],
              let pineappleStock = fruitInventory[.pineapple],
              let mangoStock = fruitInventory[.mango],
              let kiwiStock = fruitInventory[.kiwi]
        else {
            return
        }
        strawberryStockLabel.text = String(strawberryStock)
        bananaStockLabel.text = String(bananaStock)
        pineappleStockLabel.text = String(pineappleStock)
        mangoStockLabel.text = String(mangoStock)
        kiwiStockLabel.text = String(kiwiStock)
    }
    
    @IBAction func didTapStockChangeButton(_ sender: UIBarButtonItem) {
        if let pushStockChangeViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockChange") {
            self.navigationController?.pushViewController(pushStockChangeViewController,
                                                          animated: true)
        }
    }
    
    @IBAction func didTapStrawberryJuiceButton(_ sender: UIButton) {
        let juice: Juice = .strawberryJuice
        showAlert(of: juice)
    }
    @IBAction func didTapBananaJuiceButton(_ sender: UIButton) {
        let juice: Juice = .bananaJuice
        showAlert(of: juice)
        configureStockLabel()
    }
    
    @IBAction func didTapPineappleJuiceButton(_ sender: UIButton) {
        let juice: Juice = .pineappleJuice
        showAlert(of: juice)
        configureStockLabel()
    }
    @IBAction func didTapKiwiJuiceButton(_ sender: UIButton) {
        let juice: Juice = .kiwiJuice
        showAlert(of: juice)
        configureStockLabel()
    }
    @IBAction func didTapMangoJuiceButton(_ sender: UIButton) {
        let juice: Juice = .mangoJuice
        showAlert(of: juice)
        configureStockLabel()
    }
    @IBAction func didTapStrawberryBananaJuiceButton(_ sender: UIButton) {
        let juice: Juice = .strawberryBananaJuice
        showAlert(of: juice)
        configureStockLabel()
    }
    @IBAction func didTapMangoKiwiJuiceButton(_ sender: UIButton) {
        let juice: Juice = .mangoKiwiJuice
        showAlert(of: juice)
        configureStockLabel()
    }
    
    func showAlert(of juice: Juice) {
        if juiceMaker.takeOrder(juice) {
            showCompletionAlert(for: juice)
        } else {
            showFailureAlert()
        }
    }
    
    func showCompletionAlert(for juice: Juice) {
        let juiceCompletionAlert = UIAlertController(title: nil,
                                                     message: "\(juice.name)가 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: UIAlertController.Style.alert)
        let closeAction = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default)
        juiceCompletionAlert.addAction(closeAction)
        present(juiceCompletionAlert, animated: true, completion: nil)
    }
    
    func showFailureAlert() {
        let juiceFailureAlert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: UIAlertController.Style.alert)
        let stockChangeAction = UIAlertAction(title: "예",
                                              style: UIAlertAction.Style.destructive)
        { stockChangeAction in self.didTapStockChangeButton(self.stockChangeButton) }
        let closeAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.cancel)
        juiceFailureAlert.addAction(stockChangeAction)
        juiceFailureAlert.addAction(closeAction)
        present(juiceFailureAlert, animated: true, completion: nil)
    }
}

