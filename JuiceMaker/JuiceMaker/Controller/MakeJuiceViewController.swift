//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class MakeJuiceViewController: UIViewController {
    @IBOutlet private weak var orderStrawberryJuiceButton: UIButton!
    @IBOutlet private weak var orderBananaJuiceButton: UIButton!
    @IBOutlet private weak var orderPineappleJuiceButton: UIButton!
    @IBOutlet private weak var orderKiwiJuiceButton: UIButton!
    @IBOutlet private weak var orderStrawberryAndBananaJuiceButton: UIButton!
    @IBOutlet private weak var orderMangoJuiceButton: UIButton!
    @IBOutlet private weak var orderMangoAndKiwiJuiceButton: UIButton!
        
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshFruits()
    }
    
    @IBAction private func orderButton(_ sender: UIButton) {
        switch sender {
        case orderStrawberryJuiceButton:
            let result = juiceMaker.make(.strawberry)
            alert(result)
        case orderBananaJuiceButton:
            let result = juiceMaker.make(.banana)
            alert(result)
        case orderPineappleJuiceButton:
            let result = juiceMaker.make(.pineapple)
            alert(result)
        case orderKiwiJuiceButton:
            let result = juiceMaker.make(.kiwi)
            alert(result)
        case orderStrawberryAndBananaJuiceButton:
            let result = juiceMaker.make(.strawberryAndBanana)
            alert(result)
        case orderMangoJuiceButton:
            let result = juiceMaker.make(.mango)
            alert(result)
        case orderMangoAndKiwiJuiceButton:
            let result = juiceMaker.make(.mangoAndKiwi)
            alert(result)
        default:
            return
        }
        refreshFruits()
    }
    
    private func alert(_ result: Result<FruitJuice, FruitError>) {
        switch result {
        case .success(let juice):
            let successAlert = UIAlertController(
                title: nil,
                message: "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!",
                preferredStyle: UIAlertController.Style.alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            successAlert.addAction(confirmAction)
            self.present(successAlert, animated: true, completion: nil)
        case .failure(let error):
            let failureAlert = UIAlertController(
                title: nil,
                message: error.errorDescription,
                preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
            let presentEditFruitsViewControllerAction = UIAlertAction(title: "예", style: .default) { _ in
                self.performSegue(withIdentifier: "editFruitsSegue", sender: self)
            }
            failureAlert.addAction(cancelAction)
            failureAlert.addAction(presentEditFruitsViewControllerAction)
            self.present(failureAlert, animated: true, completion: nil)
        }
    }

    private func refreshFruits() {
        let fruits = juiceMaker.fruitsInStock
        strawberryLabel.text = String(fruits[.strawberry] ?? 0)
        bananaLabel.text = String(fruits[.banana] ?? 0)
        kiwiLabel.text = String(fruits[.kiwi] ?? 0)
        pineappleLabel.text = String(fruits[.pineapple] ?? 0)
        mangoLabel.text = String(fruits[.mango] ?? 0)
    }
}

