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
    var fruitStore = FruitStore()
    
    // MARK: 재고수정 버튼 눌렀을 시 화면 전환
    @IBAction func navpush(_ sender: Any) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
    @IBAction func orderStrawBerryJuice(_ sender: UIButton) {
        orderjuice(fruitjuice: .strawberryBanana)
        }
        
       
    //MARK: 공동으로 사용 하는 함수
    func orderjuice(fruitjuice: JuiceTypes) {
        updateUI()
        var juiceSet = Dictionary<JuiceTypes, Int>()
        let orderJuice = JuiceMaker()
        juiceSet = orderJuice.makeJuice(fruitJuice: fruitjuice, fruitStore: fruitStore)
        if juiceSet.isEmpty {
            showAlertMessage()
        } else {
            mangoCount.text = String(juiceSet[fruitjuice]!)
            showConfirmAlert(juiceTypes: fruitjuice)
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
    
    
    func updateUI () {
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
