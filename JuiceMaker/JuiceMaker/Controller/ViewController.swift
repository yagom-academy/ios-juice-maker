//
//  JuiceMaker - ViewController.swift
//  Created by yeha.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var stockOfStrawberry: UILabel!
    @IBOutlet weak private var stockOfBanana: UILabel!
    @IBOutlet weak private var stockOfPineapple: UILabel!
    @IBOutlet weak private var stockOfKiwi: UILabel!
    @IBOutlet weak private var stockOfMango: UILabel!
    
    @IBAction func strawberryBananaJuiceButton(_ sender: Any) {
        order(juice: .strawberryBananaJuice)
    }
    
    @IBAction func strawberryJuiceButton(_ sender: Any) {
        order(juice: .strawberryJuice)
    }
    
    @IBAction func bananaJuiceButton(_ sender: Any) {
        order(juice: .bananaJuice)
    }
    
    @IBAction func mangoKiwiJuiceButton(_ sender: Any) {
        order(juice: .mangoKiwiJuice)
    }
    
    @IBAction func pineappleJuiceButton(_ sender: Any) {
        order(juice: .pineappleJuice)
    }
    
    @IBAction func kiwiJuiceButton(_ sender: Any) {
        order(juice: .kiwiJuice)
    }
    
    @IBAction func mangoJuiceButton(_ sender: Any) {
        order(juice: .mangoJuice)
    }
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCurrentStockLables()
    }
 
    func updateCurrentStockLables () {
        guard let strawberry = juiceMaker.fruitStore.fruits[.strawberry],
              let banana = juiceMaker.fruitStore.fruits[.banana],
              let pineapple = juiceMaker.fruitStore.fruits[.pineapple],
              let kiwi = juiceMaker.fruitStore.fruits[.kiwi],
              let mango = juiceMaker.fruitStore.fruits[.mango] else {
            return
        }
        stockOfStrawberry.text = String(strawberry)
        stockOfBanana.text = String(banana)
        stockOfPineapple.text = String(pineapple)
        stockOfKiwi.text = String(kiwi)
        stockOfMango.text = String(mango)
    }

    private func showSuccessAlert(juiceName: String) {
        let successAlertViewController = UIAlertController(title: "재고 있음", message: "\(juiceName)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        successAlertViewController.addAction(okAction)
        present(successAlertViewController, animated: true, completion: nil)
    }

    private func showFailureAlert() {
        let failureAlertViewController = UIAlertController(title: "재고 없음", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
            self.performSegue(withIdentifier: "changeStock", sender: nil)
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        failureAlertViewController.addAction(cancelAction)
        failureAlertViewController.addAction(okAction)
        present(failureAlertViewController, animated: true, completion: nil)
    }
    
    func order(juice: Juice) {
        if juiceMaker.order(for: juice) {
            updateCurrentStockLables()
            showSuccessAlert(juiceName: juice.name)
        } else {
            showFailureAlert()
        }
    }
}
