//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MakeJuiceViewController: UIViewController {
    @IBOutlet weak var orderStrawberryJuiceButton: UIButton!
    @IBOutlet weak var orderBananaJuiceButton: UIButton!
    @IBOutlet weak var orderPineappleJuiceButton: UIButton!
    @IBOutlet weak var orderKiwiJuiceButton: UIButton!
    @IBOutlet weak var orderStrawberryAndBananaJuiceButton: UIButton!
    @IBOutlet weak var orderMangoJuiceButton: UIButton!
    @IBOutlet weak var orderMangoAndKiwiJuiceButton: UIButton!
    @IBOutlet weak var addFruitsButton: UIBarButtonItem!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func orderButton(_ sender: UIButton) {
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
    }
}

extension MakeJuiceViewController {
    func alert(_ result: Result<FruitJuice, FruitError>) {
        switch result {
        case .success(let juice):
            let successAlert = UIAlertController(title: nil,
                                                 message: "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!",
                                                 preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            successAlert.addAction(action)
            self.present(successAlert, animated: true, completion: nil)
        case .failure(let error):
            let failureAlert = UIAlertController(title: nil,
                                                 message: error.errorDescription,
                                                 preferredStyle: .alert)
            let moveAction = UIAlertAction(title: "예", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
            failureAlert.addAction(moveAction)
            failureAlert.addAction(cancelAction)
            self.present(failureAlert, animated: true, completion: nil)
        }
    }
}
