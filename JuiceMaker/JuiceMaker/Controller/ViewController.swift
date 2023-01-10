//  JuiceMaker - ViewController.swift
//  Created by 송준, Rowan on 2023/01/05.
//  Copyright © yagom academy. All rights reserved.

import UIKit
import Foundation

final class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    private var fruitsStock: [Fruits: Int] {
        return FruitStore.shared.fruitsStock
    } //copy on write 왜 찾아보라고 하셨을까..?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStock()
    }
    
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineApple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    @IBOutlet weak var strawberryButton: UIButton!
    
    enum OrderButton {
        case strawberryButton
    }
    
    enum AlertMessege {
        static let confirm = "확인"
        static let yes = "예"
        static let no = "아니오"
        static let madeJuice = "가 나왔습니다. 맛있게 드세요!"
        static let lackOfStock = "재료가 모자라요. 재고를 수정할까요?"
        static let success = "성공"
        static let failure = "실패"
    }
    
    func displayStock() {
        if let strawberryStock = fruitsStock[.strawberry],
           let bananaStock = fruitsStock[.banana],
           let pineappleStock = fruitsStock[.pineapple],
           let kiwiStock = fruitsStock[.kiwi],
           let mangoStock = fruitsStock[.mango] {
            stockOfStrawberry.text = String(strawberryStock)
            stockOfBanana.text = String(bananaStock)
            stockOfPineApple.text = String(pineappleStock)
            stockOfKiwi.text = String(kiwiStock)
            stockOfMango.text = String(mangoStock)
        }
    }
    
    @IBAction func ClickChangeStock(_ sender: Any) {
        moveToChangeStockViewController()
    }
    
    func moveToChangeStockViewController() {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChangeStock") as? ChangeStockViewController else { return }
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    func setSuccessAlert(juiceName: JuiceMaker.Juice) {
        let successAlert = UIAlertController(title: AlertMessege.success,
                                             message: juiceName.name + AlertMessege.madeJuice,
                                             preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: AlertMessege.confirm,
                                      style: UIAlertAction.Style.default,
                                      handler: nil)
        successAlert.addAction(offAction)
        present(successAlert, animated: true, completion: nil)
    }
    
    func setFailAlert() {
        let failAlert = UIAlertController(title: AlertMessege.failure,
                                          message: AlertMessege.lackOfStock,
                                          preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: AlertMessege.yes,
                                      style: UIAlertAction.Style.default,
                                      handler: { Action in self.moveToChangeStockViewController() })
        
        let noAction = UIAlertAction(title: AlertMessege.no,
                                     style: UIAlertAction.Style.default,
                                     handler: nil)
        failAlert.addAction(yesAction)
        failAlert.addAction(noAction)
        present(failAlert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        do {
            try juiceMaker.make(juice: .strawberryBanana)
            setSuccessAlert(juiceName: .strawberryBanana)
            displayStock()
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
            displayStock()
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
            displayStock()
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
            displayStock()
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
            displayStock()
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
            displayStock()
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
            displayStock()
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
}


