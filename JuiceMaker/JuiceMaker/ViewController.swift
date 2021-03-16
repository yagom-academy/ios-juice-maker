//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var orderStrawberryJuiceButton: UIButton!
    @IBOutlet var orderBananaJuiceButton: UIButton!
    @IBOutlet var orderPineappleJuiceButton: UIButton!
    @IBOutlet var orderKiwiJuiceButton: UIButton!
    @IBOutlet var orderMangoJuiceButton: UIButton!
    @IBOutlet var orderStrawberryBananaJuiceButton: UIButton!
    @IBOutlet var orderMangoKiwiJuiceButton: UIButton!
    @IBOutlet var strawberryCount: UILabel!
    @IBOutlet var bananaCount: UILabel!
    @IBOutlet var pineappleCount: UILabel!
    @IBOutlet var kiwiCount: UILabel!
    @IBOutlet var mangoCount: UILabel!
    var juiceMaker: JuiceMaker = JuiceMaker.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
//        let alert = UIAlertController(title: "쥬스 완성", message: "딸기 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
//        juiceMaker.makeJuice(using: .strawberry)
//    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        do {
            try juiceMaker.makeJuice(using: .strawberry)
        } catch {
            
        }
    }
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        let alert = UIAlertController(title: "쥬스 완성", message: "바나나 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        juiceMaker.makeJuice(using: .strawberryBanana)
        
    }
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        let alert = UIAlertController(title: "쥬스 완성", message: "파인애플 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
    }
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        let alert = UIAlertController(title: "쥬스 완성", message: "키위 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
    }
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        let alert = UIAlertController(title: "쥬스 완성", message: "망고 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
    }
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        let alert = UIAlertController(title: "쥬스 완성", message: "딸바 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
    }
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        let alert = UIAlertController(title: "쥬스 완성", message: "망키 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        
    }
    
    
    
//    let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
//    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//    NSLog("The \"OK\" alert occured.")
//    }))
//    self.present(alert, animated: true, completion: nil)

    
    
    
}

