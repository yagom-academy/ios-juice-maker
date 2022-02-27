//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var juiceMaker = JuiceMaker()
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineapple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        stockOfStrawberry.text = String(juiceMaker.fruitStore.fruits[FruitType.strawberry] ?? 0)
        stockOfBanana.text = String(juiceMaker.fruitStore.fruits[FruitType.banana] ?? 0)
        stockOfPineapple.text = String(juiceMaker.fruitStore.fruits[FruitType.pineapple] ?? 0)
        stockOfKiwi.text = String(juiceMaker.fruitStore.fruits[FruitType.kiwi] ?? 0)
        stockOfMango.text = String(juiceMaker.fruitStore.fruits[FruitType.mango] ?? 0)
    }

    @IBOutlet weak var orderStrawberryBananaButton: UIButton!
    @IBOutlet weak var orderMangoKiwiButton: UIButton!
    @IBOutlet weak var orderStrawberryButton: UIButton!
    @IBOutlet weak var orderBananaButton: UIButton!
    @IBOutlet weak var orderPineappleButton: UIButton!
    @IBOutlet weak var orderKiwiButton: UIButton!
    @IBOutlet weak var orderMangoButton: UIButton!
    
    @IBAction func orderJuiceAction(_ sender: UIButton) {
        let juiceName: String = sender.currentTitle!.components(separatedBy: " ")[0]
        do { try juiceMaker.makeJuice(juice: JuiceMaker.JuiceType.init(rawValue: juiceName)!) }
        catch {
            print("재고없음")
        }
    }
    
    
    

}

