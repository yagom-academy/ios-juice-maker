//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setFruitStockLabel()
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        do {
            guard let menu = JuiceMenu(rawValue: sender.tag) else {
                throw JuiceError.nonexistentJuiceMenu
            }
            
            try juiceMaker.make(juice: menu)
            setFruitStockLabel()
            present(alertJuiceReady(menu: menu), animated: true)
        } catch {
            switch error {
            case JuiceError.nonexistentFruit:
                print("FruitStore에 해당 Fruit이 없습니다.")
            case JuiceError.shortageFruitStock:
                print("Fruit의 수량이 부족합니다.")
                present(alertShortageStock(), animated: true)
            case JuiceError.nonexistentJuiceMenu:
                print("JuiceMenu에 해당 메뉴가 없습니다.")
            default:
                print("알 수 없는 에러")
            }
        }
    }
    
    func setFruitStockLabel() {
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
    
    func alertJuiceReady(menu: JuiceMenu) -> UIAlertController {
        let juiceAlert = UIAlertController(title: "제조 완료", message: "\(menu.name) 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
        juiceAlert.addAction(UIAlertAction(title: "Yes!", style: .default, handler: { _ in print("yes 클릭") }))

        return juiceAlert
    }
    
    func alertShortageStock() -> UIAlertController {
        let juiceAlert = UIAlertController(title: "Juice", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        
        juiceAlert.addAction(UIAlertAction(title: "예", style: .destructive, handler: { _ in self.moveToFruitStoreViewController() }))
        juiceAlert.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: { _ in print("no 클릭") }))
        
        return juiceAlert
    }
    
    func moveToFruitStoreViewController() {
        guard let fruitStoreViewController = self.storyboard?.instantiateViewController(withIdentifier: "FruitStoreViewController") as? FruitStoreViewController else {
            return
        }
        
        fruitStoreViewController.modalTransitionStyle = .coverVertical
        
        self.present(fruitStoreViewController, animated: true)
    }
}
