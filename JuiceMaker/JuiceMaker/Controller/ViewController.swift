//
//  JuiceMaker - ViewController.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let someJuiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFruitStock()
    }
    
    func make(_ juice: Juice) {
        do {
            try someJuiceMaker.checkFruitAvailable(for: juice)
            try someJuiceMaker.checkPossibilityOfMaking(juice)
            showSuccessAlert(juice)
        } catch (let error) {
            someJuiceMaker.fruitStore.handle(error)
            showFailAlert()
        }
    }
    
    @IBAction func makeJuiceButton(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else { return }
        
        make(juice)
        updateFruitStock()
    }
    
    func updateFruitStock() {
        strawberryLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.strawberry] ?? 0)
        bananaLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.banana] ?? 0)
        pineappleLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.pineapple] ?? 0)
        kiwiLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.kiwi] ?? 0)
        mangoLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.mango] ?? 0)
    }
    
    @IBAction func editStock(_ sender: UIBarButtonItem) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func showSuccessAlert(_ juice: Juice) {
        let showAlert = UIAlertController(title: "\(juice.name) 쥬스 나왔습니다!\n 맛있게 드세요!", message: nil, preferredStyle: .alert)

        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

        showAlert.addAction(ok)

        present(showAlert, animated: true)
    }
    
    func showFailAlert() {
        let failAlert = UIAlertController(title: "재료가 모자라요.\n 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let no = UIAlertAction(title: "아니오", style: .destructive)
        let yes = UIAlertAction(title: "예", style: .default) { action in
            if let editMenu = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") {
                self.navigationController?.pushViewController(editMenu, animated: true)
            }
        }
        failAlert.addAction(no)
        failAlert.addAction(yes)
        present(failAlert, animated: true)
    }
    
}
