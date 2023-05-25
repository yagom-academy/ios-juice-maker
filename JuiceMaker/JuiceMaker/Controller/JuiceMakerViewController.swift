//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {

    @IBOutlet private weak var strawberryStockLabel: UILabel!
    @IBOutlet private weak var bananaStockLabel: UILabel!
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setFruitStockLabel()
        setJuiceOrderButtonTag()
    }
    
    @IBAction private func tapStockChangeButton(_ sender: UIBarButtonItem) {
        showFruitStockViewController()
    }
    
    @IBAction private func tapJuiceOrderButton(_ sender: UIButton) {
        do {
            let menu = try matchJuiceMenu(by: sender.tag)
            
            try juiceMaker.make(juice: menu)
            setFruitStockLabel()

            let alert = AlertBuilder()
                .setMessage("\(menu.name) 나왔습니다! 맛있게 드세요!")
                .addAction(title: "Yes!", style: .default)
                .build()
            
            present(alert, animated: true)
        } catch {
            switch error {
            case JuiceError.shortageFruitStock:
                print("Fruit의 수량이 부족합니다.")
                
                let alert = AlertBuilder()
                    .setTitle("재고 부족")
                    .setMessage("재료가 모자라요. 재고를 수정할까요?")
                    .addAction(title: "예", style: .destructive) { _ in self.showFruitStockViewController() }
                    .addAction(title: "아니오", style: .cancel)
                    .build()
                
                present(alert, animated: true)
                
                return
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            case JuiceError.nonexistentJuiceMenu:
                print("JuiceMenu에 해당 메뉴가 없습니다.")
            default:
                print("알 수 없는 에러")
            }
            
            let alert = AlertBuilder()
                .setMessage("쥬스를 만들 수 없습니다.")
                .addAction(title: "Yes!", style: .default)
                .build()
            
            present(alert, animated: true)
        }
    }
    
    private func setFruitStockLabel() {
        strawberryStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.strawberry] ?? 0)
        bananaStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.banana] ?? 0)
        pineappleStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.pineapple] ?? 0)
        kiwiStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.kiwi] ?? 0)
        mangoStockLabel.text = String(juiceMaker.fruitStore.fruitStock[.mango] ?? 0)
    }
    
    private func showFruitStockViewController() {
        guard let fruitStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") as? FruitStockViewController else {
            return
        }
        
        fruitStockViewController.modalTransitionStyle = .coverVertical
        fruitStockViewController.delegate = self
        fruitStockViewController.fruitStock = juiceMaker.fruitStore.fruitStock
        
        self.present(fruitStockViewController, animated: true)
    }
    
    private func setJuiceOrderButtonTag() {
        strawberryJuiceOrderButton.tag = 0
        bananaJuiceOrderButton.tag = 1
        kiwiJuiceOrderButton.tag = 2
        pineappleJuiceOrderButton.tag = 3
        strawberryBananaJuiceOrderButton.tag = 4
        mangoJuiceOrderButton.tag = 5
        mangoKiwiJuiceOrderButton.tag = 6
    }
    
    private func matchJuiceMenu(by tag: Int) throws -> JuiceMenu {
        switch tag {
        case 0:
            return .strawberryJuice
        case 1:
            return .bananaJuice
        case 2:
            return .kiwiJuice
        case 3:
            return .pineappleJuice
        case 4:
            return .strawberryBananaJuice
        case 5:
            return .mangoJuice
        case 6:
            return .mangoKiwiJuice
        default:
            throw JuiceError.nonexistentJuiceMenu
        }
    }
}

extension JuiceMakerViewController: FruitStockDelegate {
    func change(_ fruitStock: [Fruit : Int]) {
        juiceMaker.fruitStore.changeStock(fruitStock)
        setFruitStockLabel()
    }
}
