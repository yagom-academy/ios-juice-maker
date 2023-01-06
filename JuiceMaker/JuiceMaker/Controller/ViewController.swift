//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineApple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    @IBAction func ClickChangeStock(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStock") as! ChangeStockViewController
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .strawberryBanana)
            let successAlert = UIAlertController(title: "딸바쥬스가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            successAlert.addAction(offAction)
            present(successAlert, animated: true, completion: nil)
        } catch StockError.outOfStock {
            //let Alert: UIAlertController()
        } catch {
            print(error)
        }
    }
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .strawberry)
            let successAlert = UIAlertController(title: "딸기쥬스가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            successAlert.addAction(offAction)
            present(successAlert, animated: true, completion: nil)
        } catch StockError.outOfStock {
            //let Alert: UIAlertController()
        } catch {
            print(error)
        }
    }
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .banana)
            let successAlert = UIAlertController(title: "바나나쥬스가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            successAlert.addAction(offAction)
            present(successAlert, animated: true, completion: nil)
        } catch StockError.outOfStock {
            //let Alert: UIAlertController()
        } catch {
            print(error)
        }
    }
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .pineapple)
            let successAlert = UIAlertController(title: "파인애플쥬스가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            successAlert.addAction(offAction)
            present(successAlert, animated: true, completion: nil)
        } catch StockError.outOfStock {
            //let Alert: UIAlertController()
        } catch {
            print(error)
        }
    }
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .kiwi)
            let successAlert = UIAlertController(title: "키위쥬스가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            successAlert.addAction(offAction)
            present(successAlert, animated: true, completion: nil)
        } catch StockError.outOfStock {
            //let Alert: UIAlertController()
        } catch {
            print(error)
        }
    }
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .mango)
            let successAlert = UIAlertController(title: "망고쥬스가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            successAlert.addAction(offAction)
            present(successAlert, animated: true, completion: nil)
        } catch StockError.outOfStock {
            //let Alert: UIAlertController()
        } catch {
            print(error)
        }
    }
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .mangoKiwi)
            let successAlert = UIAlertController(title: "망키쥬스가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
            successAlert.addAction(offAction)
            present(successAlert, animated: true, completion: nil)
        } catch StockError.outOfStock {
            //let Alert: UIAlertController()
        } catch {
            print(error)
        }
    }
}


