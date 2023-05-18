//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    
    @IBOutlet private weak var stockChangeButton: UIBarButtonItem!
    
    @IBOutlet private weak var strawberryStock: UILabel!
    @IBOutlet private weak var bananaStock: UILabel!
    @IBOutlet private weak var pineappleStock: UILabel!
    @IBOutlet private weak var kiwiStock: UILabel!
    @IBOutlet private weak var mangoStock: UILabel!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapStockChangeButton(_ sender: UIBarButtonItem) {
        if let pushStockChangeViewController = self.storyboard?.instantiateViewController(withIdentifier: "stockChange") {
            self.navigationController?.pushViewController(pushStockChangeViewController,
                                                          animated: true)
        }
    }
    
    @IBAction func didTapStrawberryJuiceButton(_ sender: UIButton) {
        let juice: Juice = .strawberryJuice
        showAlert(of: juice)
    }
    @IBAction func didTapBananaJuiceButton(_ sender: UIButton) {
        let juice: Juice = .bananaJuice
        showAlert(of: juice)
    }
    
    @IBAction func didTapPineappleJuiceButton(_ sender: UIButton) {
        let juice: Juice = .pineappleJuice
        showAlert(of: juice)
    }
    @IBAction func didTapKiwiJuiceButton(_ sender: UIButton) {
        let juice: Juice = .kiwiJuice
        showAlert(of: juice)
    }
    @IBAction func didTapMangoJuiceButton(_ sender: UIButton) {
        let juice: Juice = .mangoJuice
        showAlert(of: juice)
    }
    @IBAction func didTapStrawberryBananaJuiceButton(_ sender: UIButton) {
        let juice: Juice = .strawberryBananaJuice
        showAlert(of: juice)
    }
    @IBAction func didTapMangoKiwiJuiceButton(_ sender: UIButton) {
        let juice: Juice = .mangoKiwiJuice
        showAlert(of: juice)
    }
    
    func showAlert(of juice: Juice) {
        if juiceMaker.takeOrder(juice) {
            showCompletionAlert(for: juice)
        } else {
            showFailureAlert()
        }
    }
    
    func showCompletionAlert(for juice: Juice) {
        let juiceCompletionAlert = UIAlertController(title: nil,
                                                     message: "\(juice.name)가 나왔습니다! 맛있게 드세요!",
                                      preferredStyle: UIAlertController.Style.alert)
        let closeAction = UIAlertAction(title: "닫기", style: UIAlertAction.Style.default)
        juiceCompletionAlert.addAction(closeAction)
        present(juiceCompletionAlert, animated: true, completion: nil)
    }
    
    func showFailureAlert() {
        let juiceFailureAlert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: UIAlertController.Style.alert)
        let stockChangeAction = UIAlertAction(title: "예",
                                              style: UIAlertAction.Style.destructive)
        { stockChangeAction in self.didTapStockChangeButton(self.stockChangeButton) }
        let closeAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.cancel)
        juiceFailureAlert.addAction(stockChangeAction)
        juiceFailureAlert.addAction(closeAction)
        present(juiceFailureAlert, animated: true, completion: nil)
    }
}

