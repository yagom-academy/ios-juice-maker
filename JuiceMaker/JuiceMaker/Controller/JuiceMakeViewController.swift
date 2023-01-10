//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakeViewController: UIViewController {
    
    var currentFruitBasket: [Fruit: Int] {
        return FruitStore.shared.fruitsBasket
    }
    
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpLabel()
    }
    
    func setUpLabel() {
        strawberryLabel.text = currentFruitBasket[.strawberry]?.description
        bananaLabel.text = currentFruitBasket[.banana]?.description
        pineappleLabel.text = currentFruitBasket[.pineapple]?.description
        kiwiLabel.text = currentFruitBasket[.kiwi]?.description
        mangoLabel.text = currentFruitBasket[.mango]?.description
        [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel].forEach {
            $0.sizeToFit()
        }
    }
    
    func createButtonTarget(_ sender: UIButton) -> FruitJuice? {
        guard let titleLabel = sender.titleLabel?.text else {
            return nil
        }
        
        switch titleLabel {
        case "딸기쥬스 주문":
            return FruitJuice.strawberryJuice
        case "바나나쥬스 주문":
            return FruitJuice.bananaJuice
        case "파인애플쥬스 주문":
            return FruitJuice.pineappleJuice
        case "키위쥬스 주문":
            return FruitJuice.kiwiJuice
        case "망고쥬스 주문":
            return FruitJuice.mangoJuice
        case "딸바쥬스 주문":
            return FruitJuice.strawberryBananaJuice
        case "망키쥬스 주문":
            return FruitJuice.mangoKiwiJuice
        default:
            return nil
        }
    }
    
    func showSuccessAlert(with targetJuice: FruitJuice) {
        let successAlert = UIAlertController(
            title: "주스 제조성공",
            message: "\(targetJuice.rawValue) 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "OK", style: .default)
        successAlert.addAction(alertAction)
        self.present(successAlert, animated: true)
    }
    
    func showFailureAlert() {
        let failureAlert = UIAlertController(
            title: "주스 제조실패",
            message: "재료가 모자라요. 재고를 수정할까요?",
            preferredStyle: .alert
        )
        let okAlertAction = UIAlertAction(title: "네", style: .default) { _ in
            self.presentFruitStoreVC()
        }
        let cancelAlertAction = UIAlertAction(title: "아니오", style: .cancel)
        
        failureAlert.addAction(okAlertAction)
        failureAlert.addAction(cancelAlertAction)
        self.present(failureAlert, animated: true)
    }
    
    func presentFruitStoreVC() {
        guard let FruitStoreVC = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") as? FruitStoreViewController else {
            return
        }
        self.present(FruitStoreVC, animated: true)
    }
    
    @IBAction func FruitStoreVCButtonTapped(_ sender: UIButton) {
        presentFruitStoreVC()
    }
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        guard let targetJuice = buttonTarget(sender) else {
            return
        }
        do {
            try juiceMaker.make(targetJuice)
            setUpLabel()
            showSuccessAlert(with: targetJuice)
        } catch juiceMakeError.outOfStock {
            showFailureAlert()
        } catch {
            print("알 수 없는 에러가 발생했습니다")
        }
    }
}



