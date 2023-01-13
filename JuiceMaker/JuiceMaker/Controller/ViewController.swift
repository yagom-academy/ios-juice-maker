//
//  JuiceMaker - ViewController.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    // MARK: - 과일 재고 Label Outlet
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
   
    // MARK: - 버튼 Outlet
    @IBOutlet private weak var makeStrawberryJuiceButton: UIButton!
    @IBOutlet private weak var makeBananaJuiceButton: UIButton!
    @IBOutlet private weak var makePineappleJuiceButton: UIButton!
    @IBOutlet private weak var makeMangoJuiceButton: UIButton!
    @IBOutlet private weak var makeKiwiJuiceButton: UIButton!
    @IBOutlet private weak var makeMangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var makeStrawberryBananaJuiceButton: UIButton!
    // MARK: -
    
    private let fruitStore = FruitStore.shared
    
    // MARK: - ViewState Method
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
        allocateButtonTag()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStockLabel()
    }

    // MARK: - 버튼에 태그 할당
    private func allocateButtonTag() {
        makeStrawberryJuiceButton.tag = Juice.strawberryJuice.rawValue
        makeBananaJuiceButton.tag = Juice.bananaJuice.rawValue
        makePineappleJuiceButton.tag = Juice.pineappleJuice.rawValue
        makeKiwiJuiceButton.tag = Juice.kiwiJuice.rawValue
        makeMangoJuiceButton.tag = Juice.mangoJuice.rawValue
        makeStrawberryBananaJuiceButton.tag = Juice.strawberryBananaJuice.rawValue
        makeMangoKiwiJuiceButton.tag = Juice.mangoKiwiJuice.rawValue
    }
    
    // MARK: - 버튼 label 과 데이터 연결
    private func updateStockLabel() {
        let fruits = fruitStore.fruits.mapValues{ String($0) }
        
        strawberryLabel.text = fruits[Fruit.strawberry]
        bananaLabel.text = fruits[Fruit.banana]
        pineappleLabel.text = fruits[Fruit.pineapple]
        kiwiLabel.text = fruits[Fruit.kiwi]
        mangoLabel.text = fruits[Fruit.mango]
    }
    
   
    // MARK: - 화면전환
    @IBAction private func editStockTapped(_ sender: UIBarButtonItem) {
        changeStockView()
    }
    
    private func changeStockView() {
        guard let editStockView = self.storyboard?.instantiateViewController(withIdentifier:
                                                                                EditStockViewController.identifier ) else { return }
        self.navigationController?.pushViewController(editStockView, animated: true)
    }
    
    @IBAction private func makeJuiceButtonDidTap(_ sender: UIButton) {
        let juiceMaker = JuiceMaker()
        
        for juice in Juice.allCases {
            guard sender.tag == juice.rawValue else { continue }
            if juiceMaker.makeJuice(juice) {
                presentSuccessAlert(juice.name)
            } else {
                presentFailureAlert()
            }
            updateStockLabel()
        }
    }
        
    // MARK: - 알람 로직
    private func presentSuccessAlert(_ juiceName: String) {
        let alert = UIAlertController(title: nil,
                                      message: "\(juiceName) 나왔습니다. 맛있게 드세요",
                                      preferredStyle: .alert)
        let check = UIAlertAction(title: "확인", style: .default)
        alert.addAction(check)
        present(alert, animated: true)
        
    }
    
    private func presentFailureAlert() {
        let alert = UIAlertController(title: nil,
                                      message: "재료가 모자라요. 재고를 수정할까요?",
                                      preferredStyle: .alert)
        let check = UIAlertAction(title: "예", style: .default) { _ in
            self.changeStockView()
        }
        let cancel = UIAlertAction(title: "아니요", style: .destructive)
        alert.addAction(check)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}


