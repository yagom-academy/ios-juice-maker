//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderJuiceViewController: UIViewController {

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var juiceMaker = JuiceMaker()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initializeLabel()
    }
    
    func initializeLabel() {
        strawberryStockLabel.text = "\(juiceMaker.store.inventory[0].count)"
        bananaStockLabel.text = "\(juiceMaker.store.inventory[1].count)"
        pineappleStockLabel.text = "\(juiceMaker.store.inventory[2].count)"
        kiwiStockLabel.text = "\(juiceMaker.store.inventory[3].count)"
        mangoStockLabel.text = "\(juiceMaker.store.inventory[4].count)"
    }
    
    func makeJuice(juiceName: JuiceName) {
        do {
            try juiceMaker.make(juiceName: juiceName)
            initializeLabel()
            showSuccessAlert(message: "\(juiceName.kor) 나왔습니다! 맛있게 드세요!")
        } catch FruitStore.FruitStoreError.lackOfStock(let count) { 
            let description = FruitStore.FruitStoreError.lackOfStock(neededStock: count).description
            showLackOfStockAlert(message: description)
        } catch {
            print(error)
        }
    }
    
    @IBAction func tapStrawberryBananaJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .strawberryBananaJuice)
    }
    @IBAction func tapMangoKiwiJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .mangoKiwiJuice)
    }
    @IBAction func tapStrawberryJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .strawberryJuice)
    }
    @IBAction func tapBananaJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .bananaJuice)
    }
    @IBAction func tapPineappleJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .pineappleJuice)
    }
    @IBAction func tapKiwiJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .kiwiJuice)
    }
    @IBAction func tapMangoJuiceButton(_ sender: UIButton) {
        makeJuice(juiceName: .mangoJuice)
    }
    

    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showLackOfStockAlert(message: String) {
        guard let editStockViewController = self.storyboard?.instantiateViewController(identifier: "EditStockNavigation") else {
            return
        }
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "재고 수정",
                                     style: .default) { (action) in
            self.present(editStockViewController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel,
                                         handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

