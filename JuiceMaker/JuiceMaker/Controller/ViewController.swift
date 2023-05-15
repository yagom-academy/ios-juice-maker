//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showStock()
    }
    
    @IBAction func orderJuiceButton(_ sender: UIButton) {
        
        guard let title = sender.currentTitle else { fatalError("버튼이 설정되지 않았습니다.") }
        
        switch title {
        case "딸기쥬스 주문":
            orderJuice(.strawberryJuice)
        case "바나나쥬스 주문":
            orderJuice(.bananaJuice)
        case "파인애플쥬스 주문":
            orderJuice(.pineappleJuice)
        case "키위쥬스 주문":
            orderJuice(.kiwiJuice)
        case "망고쥬스 주문":
            orderJuice(.mangoJuice)
        case "딸바쥬스 주문":
            orderJuice(.strawberryBananaJuice)
        case "망키쥬스 주문":
            orderJuice(.mangoKiwiJuice)
        default:
            break
        }
    }
    
    @IBAction func fixStockButton(_ sender: UIBarButtonItem) {
        pushFixStockViewController()
    }
    
    private func showStock() {
        strawberryStockLabel.text = String(juiceMaker.fruitStore.getStock(.strawberry))
        bananaStockLabel.text = String(juiceMaker.fruitStore.getStock(.banana))
        pineappleStockLabel.text = String(juiceMaker.fruitStore.getStock(.pineapple))
        kiwiStockLabel.text = String(juiceMaker.fruitStore.getStock(.kiwi))
        mangoStockLabel.text = String(juiceMaker.fruitStore.getStock(.mango))
    }
    
    private func orderJuice(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice)
            orderSuccessMessage(juice)
            showStock()
        } catch JuiceMakerError.outOfStock {
            orderFailMessage()
        } catch {
            print("알 수 없는 에러입니다.")
        }
    }
    
    private func pushFixStockViewController() {
        guard let pushViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockCorrectionViewController") else { fatalError("해당 뷰컨트롤러ID를 가진 뷰컨트롤러가 스토리보드에 없습니다.") }
        self.navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    private func orderSuccessMessage(_ juice: Juice) {
        let alertMessage = UIAlertController(title: "주문 성공", message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "예", style: .default))
        present(alertMessage, animated: true)
    }
    
    private func orderFailMessage() {
        let alertMessage = UIAlertController(title: "주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "예", style: .default) { _ in
            self.pushFixStockViewController()
        })
        alertMessage.addAction(UIAlertAction(title: "아니오", style: .default))
        present(alertMessage, animated: true)
    }
}
