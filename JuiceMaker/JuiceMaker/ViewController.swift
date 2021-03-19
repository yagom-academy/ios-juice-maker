//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    //MARK:-- @IBOutlet Properties
    
    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    @IBOutlet weak var orderStrawberryBananaJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderStrawberryJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderBananaJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderPineappleJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderMangoKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderKiwiJuiceButton: OrderJuiceButton!
    @IBOutlet weak var orderMangoJuiceButton: OrderJuiceButton!
    
    //MARK:-- Override function

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFruitCount()
    }
    
    //MARK:-- @IBAction Function

    @IBAction func moveStock(_ sender: Any) {
        guard let stockVC = self.storyboard?.instantiateViewController(identifier: "stockVC") else {
            return
        }

        self.present(stockVC, animated: false, completion: nil)
    }
    
    @IBAction func orderJuice(_ sender: OrderJuiceButton) {
        guard let juice = sender.juice else {
            return
        }
        let alert = sender.make(using: juice)
        self.present(alert, animated: true, completion: nil)
        updateFruitCount()
    }

    //MARK:-- function

    func initializeButtons() {
        orderStrawberryJuiceButton.juice = .strawberry
        orderBananaJuiceButton.juice = .banana
        orderStrawberryBananaJuiceButton.juice = .strawberryBanana
        orderKiwiJuiceButton.juice = .kiwi
        orderMangoJuiceButton.juice = .mango
        orderMangoKiwiJuiceButton.juice = .mangokiwi
        orderPineappleJuiceButton.juice = .pineapple
    }
    
    func updateFruitCount() {
        strawberryCount.text = String(JuiceMaker.shared.readStock(of: .strawberry))
        bananaCount.text = String(JuiceMaker.shared
                                    .readStock(of: .banana))
        kiwiCount.text = String(JuiceMaker.shared.readStock(of: .kiwi))
        pineappleCount.text = String(JuiceMaker.shared.readStock(of: .pineapple))
        mangoCount.text = String(JuiceMaker.shared.readStock(of: .mango))
    }
}

