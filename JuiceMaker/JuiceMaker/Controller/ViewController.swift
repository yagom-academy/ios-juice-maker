//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

let juiceMaker = JuiceMaker()
class ViewController: UIViewController {
    
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet private weak var ddalbaBtn: UIButton!
    @IBOutlet private weak var mangkiBtn: UIButton!
    @IBOutlet private weak var strawberryBtn: UIButton!
    @IBOutlet private weak var bananaBtn: UIButton!
    @IBOutlet private weak var pineappleBtn: UIButton!
    @IBOutlet private weak var kiwiBtn: UIButton!
    @IBOutlet private weak var mangoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1 - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(showFruitLabel(_:)), name: Notification.Name("changeFruitStock"), object: nil)
        print("1 - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("1 - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("changeFruitStock"), object: nil)
        print("1 - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("1 - viewDidDisappear")
        print("---------------------")
    }
    
    
    @objc private func showFruitLabel(_ notification: Notification) {
        strawberryStockLabel.text = String(juiceMaker.getAmount(.strawberry))
        bananaStockLabel.text = String(juiceMaker.getAmount(.banana))
        pineappleStockLabel.text = String(juiceMaker.getAmount(.pineapple))
        kiwiStockLabel.text = String(juiceMaker.getAmount(.kiwi))
        mangoStockLabel.text = String(juiceMaker.getAmount(.mango))
    }
    
    private func succeededMakingJuiceAlert(_ message: JuiceMaker.JuiceType) {
        let alert = UIAlertController(title: nil,
                                      message: "\(message.rawValue) 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인" ,
                                     style: . default) { (action) in
            juiceMaker.makeJuice(order: message)

        }
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    private func failedMakingJuiceAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "예", style: .default) { (action) in
            self.changeView()
        }
        let noAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(noAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction private func orderFruitJuice(_ sender: UIButton) {
        switch sender {
        case ddalbaBtn:
            judgingPossibilityOfStock(.ddalbaJuice)
        case mangkiBtn:
            judgingPossibilityOfStock(.mangoKiwiJuice)
        case strawberryBtn:
            judgingPossibilityOfStock(.strawberryJuice)
        case bananaBtn:
            judgingPossibilityOfStock(.bananaJuice)
        case pineappleBtn:
            judgingPossibilityOfStock(.pineappleJuice)
        case kiwiBtn:
            judgingPossibilityOfStock(.kiwiJuice)
        case mangoBtn:
            judgingPossibilityOfStock(.mangoJuice)
        default:
            return
        }
    }
    
    private func judgingPossibilityOfStock(_ juice: JuiceMaker.JuiceType) {
        if juiceMaker.checkStock(fruit: juice) {
            succeededMakingJuiceAlert(juice)
        } else {
            failedMakingJuiceAlert()
        }
    }
    
    private func changeView() {
        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "AddStock") else {
            return
        }
        mainVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        mainVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(mainVC, animated: true)
    }
    
}
