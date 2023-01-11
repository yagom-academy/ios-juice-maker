//  JuiceMaker - ViewController.swift
//  Created by 송준, Rowan on 2023/01/05.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    private var fruitsStock: [Fruits: Int] {
        return FruitStore.shared.fruitsStock
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStock()
    }
    
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineApple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    @IBOutlet weak var orderStrawberryBanana: UIButton!
    @IBOutlet weak var orderMangoKiwi: UIButton!
    @IBOutlet weak var orderStrawberry: UIButton!
    @IBOutlet weak var orderBanana: UIButton!
    @IBOutlet weak var orderPineapple: UIButton!
    @IBOutlet weak var orderKiwi: UIButton!
    @IBOutlet weak var orderMango: UIButton!
    
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
        self.navigationController?.present(nextVC, animated: true)
    }
    
    func setSuccessAlert(juice: JuiceMaker.Juice) {
        let successAlert = UIAlertController(title: AlertMessege.success,
                                             message: juice.name + AlertMessege.madeJuice,
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
    
    
    
    @IBAction func pushOrderButton(_ sender: UIButton) {
        guard let selectedJuice = identifyJuice(of: sender) else { return }
        
        order(selectedJuice)
    }
    
    func identifyJuice(of button: UIButton) -> JuiceMaker.Juice? {
        switch button {
        case orderStrawberry: return .strawberry
        case orderBanana: return .banana
        case orderPineapple: return .pineapple
        case orderKiwi: return .kiwi
        case orderMango: return .mango
        case orderStrawberryBanana: return .strawberryBanana
        case orderMangoKiwi: return .mangoKiwi
        default: return nil
        }
    }
    
    func order(_ juice: JuiceMaker.Juice) {
        do {
            try juiceMaker.make(juice: juice)
            setSuccessAlert(juice: juice)
            displayStock()
        } catch StockError.outOfStock {
            setFailAlert()
        } catch {
            print(error)
        }
    }
}
