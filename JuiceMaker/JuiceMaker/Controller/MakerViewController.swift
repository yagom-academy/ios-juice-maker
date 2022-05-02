//
//  MakerViewController.swift
//  JuiceMaker
//
//  Created by Kay on 2022/05/02.
//

import UIKit

class MakerViewController: UIViewController {

    
    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    var juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bringFruitCount()
        // Do any additional setup after loading the view.
    }

    func bringFruitCount() {
        strawberryCount.text = juiceMaker.fruitCount(fruitName: FruitKind.strawberry)
        bananaCount.text = juiceMaker.fruitCount(fruitName: FruitKind.banana)
        pineappleCount.text = juiceMaker.fruitCount(fruitName: FruitKind.pineapple)
        kiwiCount.text = juiceMaker.fruitCount(fruitName: FruitKind.kiwi)
        mangoCount.text = juiceMaker.fruitCount(fruitName: FruitKind.mango)
    }

}
