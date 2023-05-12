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
        orderJuice(.strawberryBananaJuice)
    }
    @IBAction func mangokiwiJuiceOrderButton(_ sender: UIButton) {
        orderJuice(.mangoKiwiJuice)
    }
    @IBAction func strawberryJuiceOrderButton(_ sender: UIButton) {
        orderJuice(.strawberryJuice)
    }
    @IBAction func bananaJuiceOrderButton(_ sender: UIButton) {
        orderJuice(.bananaJuice)
    }
    @IBAction func pineappleJuiceOrderButton(_ sender: UIButton) {
        orderJuice(.pineappleJuice)
    }
    @IBAction func kiwiJuiceOrderButton(_ sender: UIButton) {
        orderJuice(.kiwiJuice)
    }
    @IBAction func mangoJuiceOrderButton(_ sender: UIButton) {
        orderJuice(.mangoJuice)
    }
    
    @IBAction func fixStockButton(_ sender: UIBarButtonItem) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "FixStockViewControllerID") else { return }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func orderJuice(_ juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice)
            orderSuccessMessage(juice)
            showStock()
        } catch JuiceMakerError.outOfStock {
            orderFailMessage()
        } catch JuiceMakerError.nonExistentJuice {
            print("쥬스가 없습니다.")
        } catch JuiceMakerError.nonExistentFruit {
            print("과일이 없습니다.")
        } catch {
            print("알 수 없는 에러입니다.")
        }
    }
    
    func orderFailMessage() {
        let alertMessage = UIAlertController(title: "주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "예", style: .default) { _ in
            guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "FixStockViewControllerID") else { return }
            self.navigationController?.pushViewController(pushVC, animated: true)
        })
        alertMessage.addAction(UIAlertAction(title: "아니오", style: .default))
        present(alertMessage, animated: true)
    }
    
    func orderSuccessMessage(_ juice: Juice) {
        let alertMessage = UIAlertController(title: "주문 성공", message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "예", style: .default))
        present(alertMessage, animated: true)
    }
}
