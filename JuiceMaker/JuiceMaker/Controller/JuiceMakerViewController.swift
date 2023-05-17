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
    
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setFruitStockLabel()
    }
    
    @IBAction private func tapOrderJuice(_ sender: UIButton) {
        do {
            guard let menu = JuiceMenu(rawValue: sender.tag) else {
                throw JuiceError.nonexistentJuiceMenu
            }
            
            try juiceMaker.make(juice: menu)
            setFruitStockLabel()
            showJuiceReadyAlert(menu)
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            case JuiceError.shortageFruitStock:
                print("Fruit의 수량이 부족합니다.")
                showShortageFruitStockAlert()
            case JuiceError.nonexistentJuiceMenu:
                print("JuiceMenu에 해당 메뉴가 없습니다.")
            default:
                print("알 수 없는 에러")
            }
        }
    }
    
    private func setFruitStockLabel() {
        do {
            strawberryStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .strawberry))
            bananaStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .banana))
            pineappleStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .pineapple))
            kiwiStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .kiwi))
            mangoStockLabel.text = try String(juiceMaker.fruitStore.receiveStock(of: .mango))
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            default:
                print("알 수 없는 에러")
            }
        }
    }
    
    private func showJuiceReadyAlert(_ menu: JuiceMenu) {
        let juiceAlert = UIAlertController(title: "제조 완료", message: "\(menu.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        juiceAlert.addAction(UIAlertAction(title: "Yes!", style: .default, handler: { _ in print("yes 클릭") }))

        present(juiceAlert, animated: true)
    }
    
    private func showShortageFruitStockAlert() {
        let stockAlert = UIAlertController(title: "재고 부족", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        stockAlert.addAction(UIAlertAction(title: "예", style: .destructive, handler: { _ in self.showFruitStoreViewController() }))
        stockAlert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: { _ in print("no 클릭") }))
        
        present(stockAlert, animated: true)
    }
    
    private func showFruitStoreViewController() {
        guard let fruitStoreViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") as? FruitStoreViewController else {
            return
        }
        
        fruitStoreViewController.modalTransitionStyle = .coverVertical
        
        self.present(fruitStoreViewController, animated: true)
    }
}
