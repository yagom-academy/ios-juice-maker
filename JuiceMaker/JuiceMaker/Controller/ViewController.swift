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
    var labelList = [Fruit: UILabel]()
    
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
        initLabelList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabelsText(of: juiceMaker.getFruitStore)
    }
    
    // MARK: - Methods
    private func initLabelList() {
        labelList[.strawberry] = strawberryLabel
        labelList[.banana] = bananaLabel
        labelList[.pineapple] = pineappleLabel
        labelList[.kiwi] = kiwiLabel
        labelList[.mango] = mangoLabel
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
    @IBAction private func orderStrawberryBananaJuice(_ sender: UIButton) { orderJuice(of: .strawberryBanana) }
    @IBAction private func orderMangoKiwiJuice(_ sender: UIButton) { orderJuice(of: .mangoKiwi) }
    @IBAction private func orderStrawberryJuice(_ sender: UIButton) { orderJuice(of: .strawberry) }
    @IBAction private func orderBananaJuice(_ sender: UIButton) { orderJuice(of: .banana) }
    @IBAction private func orderPineappleJuice(_ sender: UIButton) { orderJuice(of: .pineapple) }
    @IBAction private func orderKiwiJuice(_ sender: UIButton) { orderJuice(of: .kiwi) }
    @IBAction private func orderMangoJuice(_ sender: UIButton) { orderJuice(of: .mango) }
}
