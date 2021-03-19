//
//  OrderUIButton.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/19.
//

import UIKit

class OrderUIButton: UIButton {
    
    var juiceMaker: JuiceMaker = JuiceMaker.shared
    var viewcontroller: ViewController = ViewController()
    
    func orderButton(juice: Juice) {
        do {
                   try juiceMaker.makeJuice(using: juice)
                   let alert = JuiceIsMadeAlertController().juiceIsMade(using: .mangokiwi)
                   viewcontroller.present(alert, animated: true, completion: nil)
            viewcontroller.mangoCount.text = viewcontroller.inStockFruit(of: .mango)
            viewcontroller.strawberryCount.text = viewcontroller.inStockFruit(of: .strawberry)
            viewcontroller.kiwiCount.text = viewcontroller.inStockFruit(of: .kiwi)
            viewcontroller.bananaCount.text = viewcontroller.inStockFruit(of: .banana)
            viewcontroller.pineappleCount.text = viewcontroller.inStockFruit(of: .pineapple)
            
               } catch {
                   let outOfStock = OutOfStockUIAlertController().outOfStock()
                   viewcontroller.present(outOfStock, animated: true, completion: nil)
       
           }
        
    }
    func asd(juice: Juice) {
        switch juice {
        case .banana:
            orderButton(juice: .banana)
        case .strawberry:
            orderButton(juice: .strawberry)
        case .kiwi:
            orderButton(juice: .kiwi)
        case .pineapple:
            orderButton(juice: .pineapple)
        case .mango:
            orderButton(juice: .mango)
        case .mangokiwi:
            orderButton(juice: .mangokiwi)
        case .strawberryBanana:
            orderButton(juice: .strawberryBanana)
        }
    }


    
    
    
    //
//    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
//        do {
//            try juiceMaker.makeJuice(using: .mangokiwi)
//            let alert = JuiceIsMadeAlertController().juiceIsMade(using: .mangokiwi)
//            self.present(alert, animated: true, completion: nil)
//            mangoCount.text = inStockFruit(of: .mango)
//            kiwiCount.text = inStockFruit(of: .kiwi)
//        } catch {
//            let outOfStock = OutOfStockUIAlertController().outOfStock()
//            self.present(outOfStock, animated: true, completion: nil)
//
//    }
//    }
    
}
