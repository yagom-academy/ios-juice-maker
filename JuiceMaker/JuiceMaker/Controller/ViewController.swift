//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private var juiceMaker: JuiceMaker = JuiceMaker()
    
    private var fruitStock: [Fruit: Int] = [:]
    
    @IBOutlet weak var strawBerryJuiceButton: UIButton!
    @IBOutlet weak var strawBerryBananaJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var changeStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawBerryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStockOnLabel()
    }
    
    private func showFruitStockOnLabel() {
        fruitStock = juiceMaker.fruitStore.receiveFruitStock()
        strawBerryStockLabel.text = self.fruitStock[.strawBerry]?.description
        bananaStockLabel.text = self.fruitStock[.banana]?.description
        pineappleStockLabel.text = self.fruitStock[.pineApple]?.description
        kiwiStockLabel.text = self.fruitStock[.kiwi]?.description
        mangoStockLabel.text = self.fruitStock[.mango]?.description
    }
    
    
    @IBAction func strawBerryJuiceButton(_ sender: Any) {
        if juiceMaker.order(.strawBerryJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock()
        } else {
            notEnoughFruitStock()
        }
    }
    
    @IBAction func strawBerryBananaJuiceButton(_ sender: Any) {
        if juiceMaker.order(.strawBerryBananaJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock()
        } else {
            notEnoughFruitStock()
        }
    }
    
    @IBAction func bananaJuiceButton(_ sender: Any) {
        if juiceMaker.order(.bananaJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock()
        } else {
            notEnoughFruitStock()
        }
    }
    
    @IBAction func pineappleJuiceButton(_ sender: Any) {
        if juiceMaker.order(.pineAppleJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock()
        } else {
            notEnoughFruitStock()
        }
    }
    
    @IBAction func kiwiJuiceButton(_ sender: Any) {
        if juiceMaker.order(.kiwiJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock()
        } else {
            notEnoughFruitStock()
        }
    }
    
    @IBAction func mangoKiwiJuiceButton(_ sender: Any) {
        if juiceMaker.order(.mangoKiwiJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock()
        } else {
            notEnoughFruitStock()
        }
    }
    
    @IBAction func mangoJuiceButton(_ sender: Any) {
        if juiceMaker.order(.mangoJuice) == true {
            showFruitStockOnLabel()
            enoughFruitStock()
        } else {
            notEnoughFruitStock()
        }
    }
    
    private func enoughFruitStock() {
        let alert = UIAlertController(title: "쥬스 나왔습니다.", message: "맛있게 드세요!", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler :nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func notEnoughFruitStock() {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정 할까요?", preferredStyle: UIAlertController.Style.alert)
        let result = UIAlertAction(title: "아니요", style: .destructive)
        let okAction = UIAlertAction(title: "예", style: .default, handler : { action in
            self.ChangeStockViewControllerPresent()
        } )
        
        alert.addAction(result)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func ChangeStockViewControllerPresent() {
        guard let changeStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStockViewController") as? ChangeStockViewController else { return }
        let navigationController = UINavigationController(rootViewController: changeStockViewController)
        changeStockViewController.delegate = self
        self.present(navigationController, animated: true)
    }
    
    
    @IBAction func changeStockBarButton(_ sender: Any) {
        ChangeStockViewControllerPresent()
    }
}


extension ViewController: FruitStockDelegate {
    func addStock(_ value: [Fruit : Int]) {
        showFruitStockOnLabel()
    }
}
