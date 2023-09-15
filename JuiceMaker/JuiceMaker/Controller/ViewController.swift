//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()

    @IBOutlet weak var stCount: UILabel!
    
    @IBOutlet weak var banaCount: UILabel!
    
    @IBOutlet weak var pineCount: UILabel!
    
    @IBOutlet weak var kiwiCount: UILabel!
    
    @IBOutlet weak var manCount: UILabel!
    
    @IBAction func stbaOrder(_ sender: UIButton) { // 딸바 버튼
        
        let goodAlertController = UIAlertController(title: "딸기쥬스 나왔습니다!", message: "맛있게 드세요!", preferredStyle: .alert)
        let goodAction = UIAlertAction(title: "네", style: .default) { (action) in
            print("확인버튼 눌림")
        }
        goodAlertController.addAction(goodAction)
        
        let badAlertController = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let badActionYes = UIAlertAction(title: "예", style: .default) { (action) in
            print("예 버튼 눌림")
            print(sender.tag)
            self.goFruitStore(sender)
        }
        let badActionNo = UIAlertAction(title: "아니오", style: .default) { (action) in
            print("아니오 버튼 눌림")
        }
        badAlertController.addAction(badActionYes)
        badAlertController.addAction(badActionNo)
        
        do {
            try juiceMaker.takeOrder(order: .strawberryBananaJuice)
            stCount.text = String(juiceMaker.checkStock(fruit: .strawberry))
            banaCount.text = String(juiceMaker.checkStock(fruit: .banana))
            present(goodAlertController, animated: true, completion: nil)
        }
        catch {
            print(error)
            present(badAlertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func mankiOrder(_ sender: UIButton) {
    }
    
    @IBAction func stOrder(_ sender: UIButton) {
    }
    
    
    
    @IBAction func goFruitStore(_ sender: UIButton) {
        let JuiceMakerVC = storyboard?.instantiateViewController(identifier: "FruitStoreVC")
        JuiceMakerVC?.modalPresentationStyle = .pageSheet
        JuiceMakerVC?.modalTransitionStyle = .coverVertical
        present(JuiceMakerVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stCount.text = String(juiceMaker.checkStock(fruit: .strawberry))
        banaCount.text = String(juiceMaker.checkStock(fruit: .banana))
        pineCount.text = String(juiceMaker.checkStock(fruit: .pineapple))
        kiwiCount.text = String(juiceMaker.checkStock(fruit: .kiwi))
        manCount.text = String(juiceMaker.checkStock(fruit: .mango))
        // Do any additional setup after loading the view.
    }


}

