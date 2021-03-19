//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var orderStrawberryJuiceButton: OrderUIButton!
    @IBOutlet var orderBananaJuiceButton: OrderUIButton!
    @IBOutlet var orderPineappleJuiceButton: OrderUIButton!
    @IBOutlet var orderKiwiJuiceButton: OrderUIButton!
    @IBOutlet var orderMangoJuiceButton: OrderUIButton!
    @IBOutlet var orderStrawberryBananaJuiceButton: OrderUIButton!
    @IBOutlet var orderMangoKiwiJuiceButton: OrderUIButton!
    @IBOutlet var strawberryCount: UILabel!
    @IBOutlet var bananaCount: UILabel!
    @IBOutlet var pineappleCount: UILabel!
    @IBOutlet var kiwiCount: UILabel!
    @IBOutlet var mangoCount: UILabel!
    @IBOutlet var addStock: UIBarButtonItem!
    var juiceMaker: JuiceMaker = JuiceMaker.shared
    var orderButton: OrderUIButton = OrderUIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func inStockFruit(of fruit: Fruit) -> String {
        return String(juiceMaker.readStock(of: fruit))
//
//        func readStock(of fruit: Fruit) -> Int {
//            stock.readCount(of: fruit)
//        }
    }
    
    
    
    @IBAction func orderFruitJuice(_ sender: OrderUIButton) {
        var juice: Juice {
        switch juice {
        case .banana:
            orderButton.orderButton(juice: .banana)
        case .strawberry:
            orderButton.orderButton(juice: .strawberry)
        case .kiwi:
            orderButton.orderButton(juice: .kiwi)
        case .pineapple:
            orderButton.orderButton(juice: .pineapple)
        case .mango:
            orderButton.orderButton(juice: .mango)
        case .mangokiwi:
            orderButton.orderButton(juice: .mangokiwi)
        case .strawberryBanana:
            orderButton.orderButton(juice: .strawberryBanana)
        }
        return juice
        
        }
        
        
        
    }
    
    
    
//    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
//        do {
//            try juiceMaker.makeJuice(using: .strawberry)
//            let alert = JuiceIsMadeAlertController().juiceIsMade(using: .strawberry)
//            self.present(alert, animated: true, completion: nil)
//            strawberryCount.text = inStockFruit(of: .strawberry)
//            //present(alert, animated: true, completion: nil)
//        } catch {
//            let outOfStock = OutOfStockUIAlertController().outOfStock()
//            self.present(outOfStock, animated: true, completion: nil)
//    }
//    }
//    @IBAction func orderKiwiJuice(_ sender: UIButton) {
//        do {
//            try juiceMaker.makeJuice(using: .kiwi)
//            let alert = JuiceIsMadeAlertController().juiceIsMade(using: .kiwi)
//            self.present(alert, animated: true, completion: nil)
//            kiwiCount.text = inStockFruit(of: .kiwi)
//        } catch {
//            let outOfStock = OutOfStockUIAlertController().outOfStock()
//            self.present(outOfStock, animated: true, completion: nil)
//    }
//    }
//    @IBAction func orderPineappleJuice(_ sender: UIButton) {
//        do {
//            try juiceMaker.makeJuice(using: .pineapple)
//            let alert = JuiceIsMadeAlertController().juiceIsMade(using: .pineapple)
//            self.present(alert, animated: true, completion: nil)
//            pineappleCount.text = inStockFruit(of: .pineapple)
//        } catch {
//            let outOfStock = OutOfStockUIAlertController().outOfStock()
//            self.present(outOfStock, animated: true, completion: nil)
//
//    }
//    }
//    @IBAction func orderMangoJuice(_ sender: UIButton) {
//        do {
//            try juiceMaker.makeJuice(using: .mango)
//            let alert = JuiceIsMadeAlertController().juiceIsMade(using: .mango)
//            self.present(alert, animated: true, completion: nil)
//            mangoCount.text = inStockFruit(of: .mango)
//        } catch {
//            let outOfStock = OutOfStockUIAlertController().outOfStock()
//            self.present(outOfStock, animated: true, completion: nil)
//
//    }
//    }
//    @IBAction func orderBananaJuice(_ sender: UIButton) {
//        do {
//            try juiceMaker.makeJuice(using: .banana)
//            let alert = JuiceIsMadeAlertController().juiceIsMade(using: .banana)
//            self.present(alert, animated: true, completion: nil)
//            bananaCount.text = inStockFruit(of: .banana)
//        } catch {
//            let outOfStock = OutOfStockUIAlertController().outOfStock()
//            self.present(outOfStock, animated: true, completion: nil)
//    }
//    }
//    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
//        do {
//            try juiceMaker.makeJuice(using: .strawberryBanana)
//            let alert = JuiceIsMadeAlertController().juiceIsMade(using: .strawberryBanana)
//            self.present(alert, animated: true, completion: nil)
//            strawberryCount.text = inStockFruit(of: .strawberry)
//            bananaCount.text = inStockFruit(of: .banana)
//        } catch {
//            let outOfStock = OutOfStockUIAlertController().outOfStock()
//            self.present(outOfStock, animated: true, completion: nil)
//
//    }
//    }
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
    @IBAction func changeView(_ sender: UIBarButtonItem) {
        guard let secondView =  self.storyboard?.instantiateViewController(identifier: "secondVC") else { return }
        self.present(secondView, animated: true)
        }
  



}


   

    
    
    
    

    
    


