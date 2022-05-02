//
//  JuiceMaker - ViewController.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel?
    @IBOutlet weak var bananaLabel: UILabel?
    @IBOutlet weak var pineappleLabel: UILabel?
    @IBOutlet weak var kiwiLabel: UILabel?
    @IBOutlet weak var mangoLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFruitStock()
    }
    
    private func updateFruitStock() {
        strawberryLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.strawberry] ?? 0)
        bananaLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.banana] ?? 0)
        pineappleLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.pineapple] ?? 0)
        kiwiLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.kiwi] ?? 0)
        mangoLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.mango] ?? 0)
    }
    
    @IBAction func makeJuiceButton(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.currentTitle ?? "") else { return }
        
        make(juice)
        updateFruitStock()
    }
    
    private func make(_ juice: Juice) {
        do {
            try juiceMaker.checkFruitAvailable(for: juice)
            try juiceMaker.checkPossibilityOfMaking(juice)
            showSuccessAlert(juice)
        } catch (let error) {
            juiceMaker.fruitStore.handle(error)
            showFailAlert()
        }
    }

    private func showSuccessAlert(_ juice: Juice) {
        let successAlert = UIAlertController(title: "\(juice.name) 쥬스 나왔습니다!\n 맛있게 드세요!",
                                             message: nil,
                                             preferredStyle: .alert)

        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

        successAlert.addAction(ok)

        present(successAlert, animated: true)
    }
    
    private func showFailAlert() {
        let failAlert = UIAlertController(title: "재료가 모자라요.\n 재고를 수정할까요?",
                                          message: nil,
                                          preferredStyle: .alert)
        let no = UIAlertAction(title: "아니오", style: .cancel)
        let yes = UIAlertAction(title: "예", style: .default) { action in
            guard let editMenu = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else { return }
            
            self.navigationController?.pushViewController(editMenu, animated: true)
        }
        failAlert.addAction(no)
        failAlert.addAction(yes)
        present(failAlert, animated: true)
    }
    
    @IBAction func editStock(_ sender: UIBarButtonItem) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else { return }
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
