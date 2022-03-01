//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    @IBOutlet weak var strawberrybananaButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    
    var fruitStore = FruitStore()
    
    // MARK: 재고수정 버튼 눌렀을 시 화면 전환
    @IBAction func navpush(_ sender: Any) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: Any) {
        orderJuices(fruitJuice: .strawberryBanana)
    }
    @IBAction func orderStrawberryJuice(_ sender: Any) {
        orderJuices(fruitJuice: .strawberry)
    }
    @IBAction func orderMangoKiwiJuice(_ sender: Any) {
        orderJuices(fruitJuice: .mangoKiwi)
    }
    @IBAction func orderBananaJuice(_ sender: Any) {
        orderJuices(fruitJuice: .banana)
    }
    
    @IBAction func orderPineappleJuice(_ sender: Any) {
        orderJuices(fruitJuice: .pineapple)
    }
    
    @IBAction func orderKiwiJuice(_ sender: Any) {
        orderJuices(fruitJuice: .kiwi)
    }
    
    @IBAction func orderMangoJuice(_ sender: Any) {
        orderJuices(fruitJuice: .mango)
    }
    
    func orderJuices(fruitJuice: JuiceTypes) {
        var juiceSet = Dictionary<JuiceTypes, Int>()
        let orderJuice = JuiceMaker()
        juiceSet = orderJuice.makeJuice(fruitJuice: fruitJuice, fruitStore: fruitStore)
        if juiceSet.isEmpty {
            showAlertMessage()
        } else {
            updateLabel(juice: juiceSet, juices: fruitJuice)
            showConfirmAlert(juiceTypes: fruitJuice)
        }
    }
    
    func updateLabel(juice: [JuiceTypes:Int], juices: JuiceTypes) {
        let errorNumber = 0
        switch juices {
        case .strawberryBanana:
            strawberryCount.text = String(juice[.strawberry] ?? errorNumber)
            bananaCount.text = String(juice[.banana] ?? errorNumber)
        case .mangoKiwi:
            mangoCount.text = String(juice[.mango] ?? errorNumber)
            kiwiCount.text = String(juice[.kiwi] ?? errorNumber)
        case .strawberry:
            strawberryCount.text = String(juice[.strawberry] ?? errorNumber)
        case .banana:
            bananaCount.text = String(juice[.banana] ?? errorNumber)
        case .pineapple:
            pineappleCount.text = String(juice[.pineapple] ?? errorNumber)
        case .kiwi:
            kiwiCount.text = String(juice[.kiwi] ?? errorNumber)
        case .mango:
            mangoCount.text = String(juice[.mango] ?? errorNumber)
        }
    }
    
    func clickButton(sender: UIButton) {
        switch sender {
        case strawberrybananaButton:
            orderStrawberryBananaJuice(sender)
        case mangoKiwiButton:
            orderMangoKiwiJuice(sender)
        case strawberryButton:
            orderStrawberryJuice(sender)
        case bananaButton:
            orderBananaJuice(sender)
        case pineappleButton:
            orderPineappleJuice(sender)
        case kiwiButton:
            orderKiwiJuice(sender)
        case mangoButton:
            orderMangoJuice(sender)
        default:
            // TODO: 새로운 에러 처리 필요
            print("에러")
        }
    }
    
    // MARK: 재고 없을 시 얼럿 메시지
    func showAlertMessage() {
        let juiceOutOfStockAlert = UIAlertController(title: AlertMessage.outOfStock, message: "", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: AlertMessage.ok, style: .default) {_ in
            guard let pushViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
        let noButton = UIAlertAction(title: AlertMessage.cancel, style: .destructive, handler: nil)
        juiceOutOfStockAlert.addAction(noButton)
        juiceOutOfStockAlert.addAction(yesButton)
        present(juiceOutOfStockAlert, animated: false, completion: nil)
    }
    
    // MARK: 재고 있을 시 얼럿 메시지
    func showConfirmAlert(juiceTypes: JuiceTypes) {
        let okButton = UIAlertAction(title: AlertMessage.ok, style: .default, handler: nil)
        let provideJuiceAlert = UIAlertController(title: "\(juiceTypes)\(AlertMessage.completeOrder)", message: "", preferredStyle: .alert)
        provideJuiceAlert.addAction(okButton)
        present(provideJuiceAlert, animated: false, completion: nil)
    }
    // TODO: 리팩토링 필요?
    func updateUI() {
        for i in fruitStore.fruits {
            if i.key == JuiceTypes.strawberry {
                strawberryCount.text = String(i.value)
            } else if i.key == JuiceTypes.banana {
                bananaCount.text = String(i.value)
            } else if i.key == JuiceTypes.kiwi {
                kiwiCount.text = String(i.value)
            } else if i.key == JuiceTypes.mango {
                mangoCount.text = String(i.value)
            } else if i.key == JuiceTypes.pineapple {
                pineappleCount.text = String(i.value)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}
