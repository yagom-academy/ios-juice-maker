//
//  MainViewController - ViewController.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    let fruitStore = FruitStore()
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker = JuiceMaker(fruitStore: fruitStore)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureUI()
    }
    
    private func configureUI() {
        strawberryStock.text = "\(fruitStore.store[.strawberry] ?? 0)"
        bananaStock.text = "\(fruitStore.store[.banana] ?? 0)"
        pineappleStock.text = "\(fruitStore.store[.pineapple] ?? 0)"
        kiwiStock.text = "\(fruitStore.store[.kiwi] ?? 0)"
        mangoStock.text = "\(fruitStore.store[.mango] ?? 0)"
    }
    
    private func showSuccessAlert(_ juice: Juice) {
        let alert = UIAlertController(title: nil, message: "\(juice.name)나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] _ in
            self?.configureUI()
        }
        alert.addAction(yesAction)
        self.present(alert, animated: true)
    }
    
    private func showFailAlert() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] _ in
            guard let stockManageViewController = self?.storyboard?.instantiateViewController(withIdentifier: "stockManage") else {
                return
            }
            self?.navigationController?.pushViewController(stockManageViewController, animated: true)
        }
        let noAction = UIAlertAction(title: "아니요", style: .destructive)
        alert.addAction(noAction)
        alert.addAction(yesAction)
        
        self.present(alert, animated: true)
    }

    private func orderJuice(type juice: Juice) {
        guard let result = juiceMaker?.makeJuice(type: juice) else {
            return
        }
        if result.isSuccess {
            self.showSuccessAlert(juice)
        } else {
            self.showFailAlert()
        }
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: Any) {
        orderJuice(type: .strawberryBananaJuice)
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: Any) {
        orderJuice(type: .mangoKiwiJuice)
    }
    
    @IBAction func orderStrawberryJuice(_ sender: Any) {
        orderJuice(type: .strawberryJuice)
    }
    
    @IBAction func orderBananaJuice(_ sender: Any) {
        orderJuice(type: .bananaJuice)
    }
    
    @IBAction func orderPineappleJuice(_ sender: Any) {
        orderJuice(type: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuice(_ sender: Any) {
        orderJuice(type: .kiwiJuice)
    }
    
    @IBAction func orderMangoJuice(_ sender: Any) {
        orderJuice(type: .mangoJuice)
    }
}

