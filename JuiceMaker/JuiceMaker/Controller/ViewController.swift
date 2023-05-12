//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showStock()
    }
    
    func showStock() {
        strawberryStockLabel.text = try? String(juiceMaker.fruitStore.getStock(.strawberry))
        bananaStockLabel.text = try? String(juiceMaker.fruitStore.getStock(.banana))
        pineappleStockLabel.text = try? String(juiceMaker.fruitStore.getStock(.pineapple))
        kiwiStockLabel.text = try? String(juiceMaker.fruitStore.getStock(.kiwi))
        mangoStockLabel.text = try? String(juiceMaker.fruitStore.getStock(.mango))
    }
    
    @IBAction func strawberrybananaJuiceOrderButton(_ sender: UIButton) {
        orderSuccessMessage()
    }
    @IBAction func mangokiwiJuiceOrderButton(_ sender: UIButton) {
        orderFailMessage()
    }
    @IBAction func strawberryJuiceOrderButton(_ sender: UIButton) {
        orderFailMessage()
    }
    @IBAction func bananaJuiceOrderButton(_ sender: UIButton) {
        orderFailMessage()
    }
    @IBAction func pineappleJuiceOrderButton(_ sender: UIButton) {
        orderFailMessage()
    }
    @IBAction func kiwiJuiceOrderButton(_ sender: UIButton) {
        orderFailMessage()
    }
    @IBAction func mangoJuiceOrderButton(_ sender: UIButton) {
        orderFailMessage()
    }
    
    @IBAction func fixStockButton(_ sender: UIBarButtonItem) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "FixStockViewControllerID") else { return }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func orderFailMessage() {
        let alertMessage = UIAlertController(title: "주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { _ in
            guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "FixStockViewControllerID") else { return }
            self.navigationController?.pushViewController(pushVC, animated: true)
        }
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alertMessage.addAction(yesAction)
        alertMessage.addAction(noAction)
        present(alertMessage, animated: true)
    }
    
    func orderSuccessMessage() {
        let alertMessage = UIAlertController(title: "주문 성공", message: "쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default)
        
        alertMessage.addAction(yesAction)
        present(alertMessage, animated: true)
    }
}

