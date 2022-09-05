//
//  JuiceMaker - ViewController.swift
//  Created by 써니쿠키, 써머캣
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var changeFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryBannaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func moveToFruitStockVC() {
        guard let fruitStoreStockViewController =
                self.storyboard?.instantiateViewController(withIdentifier: "fruitStoreStock") else { return }
        self.present(fruitStoreStockViewController, animated: true, completion: nil)
    }

    @IBAction func touchUpChangeFruitStockButton(_ sender: Any) {
        moveToFruitStockVC()
    }
    
}

