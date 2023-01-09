//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakeViewController: UIViewController {

    let fruitStore = FruitStore.shared
    
    var currentFruitBasket: [Fruit: Int] {
        return FruitStore.shared.shareFruitBasket()
    }
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let juiceMaker = JuiceMaker()
        juiceMaker.make(.mangoKiwiJuice)
        
   }
        setUpLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpLabel()
    }
    
    func setUpLabel() {
        strawberryLabel.text = currentFruitBasket[.strawberry]?.description
        bananaLabel.text = currentFruitBasket[.banana]?.description
        pineappleLabel.text = currentFruitBasket[.pineapple]?.description
        kiwiLabel.text = currentFruitBasket[.kiwi]?.description
        mangoLabel.text = currentFruitBasket[.mango]?.description
        [strawberryLabel, bananaLabel, pineappleLabel, kiwiLabel, mangoLabel].forEach {
            $0.sizeToFit()
        }
    }


}

