//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    let juiceMaker = JuiceMaker()

    /// 주문 버튼을 클릭한다.
    @IBAction func tapOrderButton(_ sender: UIButton) {
        Juice.allCases.forEach { juice in
            let order = sender.titleLabel?.text ?? ""
            checkMatch(order: order, juice: juice)
        }
    }
    
    @IBAction func tapUpdateQuantityButton(_ sender: Any) {
        self.presentModal()
    }
    
    /// 주문한 메뉴와 주스 메뉴를 비교한다.
    private func checkMatch(order: String, juice: Juice) {
        if order == juice.name + " 주문" {
            orderMenu(of: juice)
        }
    }
    
    // 주문한 주스를 만든다.
    private func orderMenu(of juice: Juice) {
        do {
            let message = try juiceMaker.make(of: juice)
            configureView()
            showConfirmAlert(for: message)
        } catch {
            showNotEnoghAlert()
        }
    }
    
    /// 모달을 표시한다.
    private func presentModal() {
        guard let modalViewController = self.storyboard?.instantiateViewController(withIdentifier: "modalViewController") as? ModalViewController else {return}
        modalViewController.juiceMaker = juiceMaker
        
        let navigaionViewController = UINavigationController(rootViewController: modalViewController)
        
        navigaionViewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(navigaionViewController, animated: true)
    }
    
    /// 확인 알럿을 표시한다.
    private func showConfirmAlert(for message: String) {
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

extension ViewController {
    /// 과일 수량을 표시한다.
    private func configureView() {
        strawberryLabel.text = String(juiceMaker.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.quantity(of: .mango))
    }
}
