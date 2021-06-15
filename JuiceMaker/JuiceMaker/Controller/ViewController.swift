//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentStockOfFruits()
        // Do any additional setup after loading the view.
    }
    
    func currentStockOfFruits() {
        strawberryStock.text = "\(juiceMaker.fruitStore.getStock(of: .strawberry))"
        bananaStock.text = "\(juiceMaker.fruitStore.getStock(of: .banana))"
        pineappleStock.text = "\(juiceMaker.fruitStore.getStock(of: .pineapple))"
        kiwiStock.text = "\(juiceMaker.fruitStore.getStock(of: .kiwi))"
        mangoStock.text = "\(juiceMaker.fruitStore.getStock(of: .mango))"
    }
    
    @IBAction func touchUpModifyStock(_ sender: UIBarButtonItem) {
        guard let moveIntoModifyStock = self.storyboard?.instantiateViewController(withIdentifier: "storage") else { return }
        self.navigationController?.pushViewController(moveIntoModifyStock, animated: true)
    }
    
    @IBAction func touchUpJuiceMenu(_ sender: UIButton) {
        var selectMenu: JuiceMenu?
    
        switch sender.tag {
        case 0:
            selectMenu = .bananaJuice
        case 1:
            selectMenu = .strawberryBananaJuice
        case 2:
            selectMenu = .strawberryJuice
        case 3:
            selectMenu = .pineappleJuice
        case 4:
            selectMenu = .mangoKiwiJuice
        case 5:
            selectMenu = .kiwiJuice
        case 6:
            selectMenu = .mangoJuice
        default:
            print("잘못된 입력입니다.")
        }
        guard let selectMenu = selectMenu else { return }
        do {
            try juiceMaker.makeJuice(of: selectMenu)
                currentStockOfFruits()
                alertMessage(Juice: selectMenu , makeJuice: true)
            } catch ErrorCase.outOfStock {
                alertMessage(Juice: selectMenu, makeJuice: false)
            } catch {
                print("Unexpected error: \(error).")
            }
    }
    
    func alertMessage(Juice: JuiceMenu, makeJuice: Bool) {
        if makeJuice == true {
            let sucessAlert = UIAlertController(title: "주문하신 \(Juice.rawValue) 나왔습니다", message: nil, preferredStyle: UIAlertController.Style.alert)
            let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : nil)
            sucessAlert.addAction(defaultAction)
            present(sucessAlert, animated: true, completion: nil)
        } else {
            let failAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler : { action in
                guard let moveIntoModifyStock = self.storyboard?.instantiateViewController(withIdentifier: "storage") else { return }
                self.navigationController?.pushViewController(moveIntoModifyStock, animated: true)})
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler : nil)
            failAlert.addAction(cancel)
            failAlert.addAction(okAction)
            present(failAlert, animated: true, completion: nil)
        }
    }
}

