//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var straberryBananaOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiOrderButton: UIButton!
    @IBOutlet weak var strawberryOrderButton: UIButton!
    @IBOutlet weak var bananaOrderButton: UIButton!
    @IBOutlet weak var pineappleOrderButton: UIButton!
    @IBOutlet weak var kiwiOrderButton: UIButton!
    @IBOutlet weak var mangoOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker()

    /// 주문 버튼을 클릭한다.
    @IBAction func tapOrderButton(_ sender: UIButton) {
        switch sender {
        case straberryBananaOrderButton:
            orderMenu(of: .strawberryBananaJuice)
        case mangoKiwiOrderButton:
            orderMenu(of: .mangoKiwiJuice)
        case strawberryOrderButton:
            orderMenu(of: .strawberryJuice)
        case bananaOrderButton:
            orderMenu(of: .bananaJuice)
        case pineappleOrderButton:
            orderMenu(of: .bananaJuice)
        case kiwiOrderButton:
            orderMenu(of: .kiwiJuice)
        case mangoOrderButton:
            orderMenu(of: .mangoJuice)
        default:
            break
        }
    }
    
    @IBAction func tapUpdateQuantityButton(_ sender: Any) {
        self.presentModal()
    }
    
    // 주문한 주스를 만든다.
    private func orderMenu(of juice: Juice) {
        do {
            let message = try juiceMaker.make(of: juice)
            configureView()
            showMessageAlert(for: message)
        } catch is FruitStoreError {
            showNotEnoghAlert()
        } catch {
            let message = "다시 시도해주세요."
            showMessageAlert(for: message)
        }
    }
    
    /// 모달을 표시한다.
    private func presentModal() {
        guard let fruitQuntityViewController = self.storyboard?.instantiateViewController(withIdentifier: "fruitQuntityViewController") as? FruitQuntityViewController else {return}
        fruitQuntityViewController.juiceMaker = juiceMaker
        fruitQuntityViewController.delegate = self
        
        let navigaionViewController = UINavigationController(rootViewController: fruitQuntityViewController)
        
        navigaionViewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(navigaionViewController, animated: true)
    }
    
    /// 확인 알럿을 표시한다.
    private func showMessageAlert(for message: String) {
        let alert = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        alert.addAction(defaultAction)
        self.present(alert, animated: false)
    }

    /// 재고 부족 알럿을 표시한다.
    private func showNotEnoghAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: "", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { _ in
            self.presentModal()
        }
        let cancleAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel)
        alert.addAction(defaultAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension JuiceOrderViewController {
    /// 과일 수량을 표시한다.
    private func configureView() {
        strawberryLabel.text = String(juiceMaker.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.quantity(of: .mango))
    }
}

extension JuiceOrderViewController: FruitQuntityViewDelegate {
    func finishModal() {
        configureView()
    }
}
