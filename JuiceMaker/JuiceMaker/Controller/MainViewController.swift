//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    let juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var ddalBaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangKiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showStock()
    }
    
    func showStock() {
        for (fruit, stock) in  juiceMaker.store.fruitList {
            switch fruit {
            case .strawberry:
                self.strawberryStockLabel.text = String(stock)
            case .banana:
                self.bananaStockLabel.text = String(stock)
            case .pineapple:
                self.pineappleStockLabel.text = String(stock)
            case .kiwi:
                self.kiwiStockLabel.text = String(stock)
            case .mango:
                self.mangoStockLabel.text = String(stock)
            }
        }
    }
    
    @IBAction func moveToManageView(_ sender: UIBarButtonItem) {
        guard let manageVC = self.storyboard?.instantiateViewController(withIdentifier: "ManageViewController") else { return }
        self.navigationController?.present(manageVC, animated: true, completion: nil)
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        switch sender {
        case ddalBaJuiceOrderButton:
            print("ddalba")
        case mangKiJuiceOrderButton:
            print("mangki")
        case strawberryJuiceOrderButton:
            print("strawberry")
        case bananaJuiceOrderButton:
            print("banana")
        case pineappleJuiceOrderButton:
            print("pineapple")
        case kiwiJuiceOrderButton:
            print("kiwi")
        case mangoJuiceOrderButton:
            print("mango")
        default:
            print("no")
        }
    }
}

