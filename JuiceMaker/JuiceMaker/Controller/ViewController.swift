//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, LabelUpdatable {
    // MARK: - Type
    private enum Message {
        static let outOfStock = "재료가 모자라요. 재고를 수정할까요?"
        
        static func completeMakingJuice(on juice: Juice) -> String {
            "\(juice) 나왔습니다! 맛있게 드세요!"
        }
    }
    
    // MARK: - Properties
    private var juiceMaker = JuiceMaker(fruitStore: FruitStore.shared)
    
    // MARK: - IBOutlets - UIButton
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
    
    // MARK: - IBOutlets - UILabel
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
   
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initButtonWithTag()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController viewWillAppear()")
        super.viewWillAppear(animated)
        updateLabelsText(of: juiceMaker.getFruitStore)
    }
    
    // MARK: - Methods
    func initButtonWithTag() {
        strawberryBananaJuiceButton.tag = Juice.strawberryBanana.juiceTag
        strawberryJuiceButton.tag = Juice.strawberry.juiceTag
        bananaJuiceButton.tag = Juice.banana.juiceTag
        kiwiJuiceButton.tag = Juice.kiwi.juiceTag
        pineappleJuiceButton.tag = Juice.pineapple.juiceTag
        mangoJuiceButton.tag = Juice.mango.juiceTag
        mangoKiwiJuiceButton.tag = Juice.mangoKiwi.juiceTag
    }
    
    func getLabel(on fruit: Fruit) -> UILabel {
        switch fruit {
            case .strawberry: return strawberryLabel
            case .banana: return bananaLabel
            case .pineapple: return pineappleLabel
            case .kiwi: return kiwiLabel
            case .mango: return mangoLabel
        }
    }
    
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func showConfirm(title: String?, message: String?, yesHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default, handler: yesHandler)
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func moveToNavigationController(action: UIAlertAction) {
        guard let stockManagerNC = self.storyboard?.instantiateViewController(withIdentifier: "StockManagerNC") else {
            return
        }
        
        stockManagerNC.modalPresentationStyle = .fullScreen // viewWillAppear() 호출 보장.
        self.present(stockManagerNC, animated: true)
    }
    
    private func orderJuice(of juice: Juice) {
        do {
            try juiceMaker.makeJuice(juice: juice)
            updateLabelsText(of: juiceMaker.getFruitStore)
            showAlert(title: "주문 완료", message: Message.completeMakingJuice(on: juice))
        } catch JuiceMakerError.outOfStock {
            showConfirm(title: "재고부족", message: Message.outOfStock, yesHandler: moveToNavigationController)
        } catch JuiceMakerError.invaildAccess {
            showAlert(title: "Error", message: "유효하지 않은 접근입니다.")
        } catch {
            fatalError("유효하지 않은 접근입니다.")
        }
    }
    
    // MARK: - IBActions
    @IBAction private func orderJuiceAction(_ sender: UIButton) {
        guard let juiceName = Juice(rawValue: sender.tag) else {
            return
        }
        orderJuice(of: juiceName)
    }

}
