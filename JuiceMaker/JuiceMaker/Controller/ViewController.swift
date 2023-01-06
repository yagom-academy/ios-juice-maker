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
        moveToChangeStockViewController()
    }
    
    func moveToChangeStockViewController() {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStock") as? ChangeStockViewController else { return }
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    func setSuccessAlert(juiceName: JuiceMaker.Juice) {
        let successAlert = UIAlertController(title: "\(juiceName.name)가 나왔습니다 맛있게 드세요", message: nil, preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        successAlert.addAction(offAction)
        present(successAlert, animated: true, completion: nil)
    }
    
    func setFailAlert() {
        let failAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "예",
                                      style: UIAlertAction.Style.default,
                                      handler: { Action in self.moveToChangeStockViewController() })
        
        let noAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        failAlert.addAction(yesAction)
        failAlert.addAction(noAction)
        present(failAlert, animated: true, completion: nil)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .strawberryBanana)
            setSuccessAlert(juiceName: .strawberryBanana)
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .strawberry)
            setSuccessAlert(juiceName: .strawberry)
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .banana)
            setSuccessAlert(juiceName: .banana)
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .pineapple)
            setSuccessAlert(juiceName: .pineapple)
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .kiwi)
            setSuccessAlert(juiceName: .kiwi)
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .mango)
            setSuccessAlert(juiceName: .mango)
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .mangoKiwi)
            setSuccessAlert(juiceName: .mangoKiwi)
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
}
