//
//  JuiceMaker - ViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class ViewController: UIViewController {
    let store = FruitStore(stockCount: 10)

    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStock()
    }
    @IBAction func tappedButton(_ sender: Any) {
        
    }
    
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.restorationIdentifier else { return }
        guard let juice = Juice(rawValue: juiceName) else { return }
        
        let juiceMaker = JuiceMaker(store: store)
        
        juiceMaker.makeJuice(juice)
        madeJuiceAlert(message: "\(juiceName) 나왔습니다! 맛있게 드세요!")
        failedAlert(message: "재료가 모자라요. 재고를 수정할까요?")
    }
    
    func madeJuiceAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func failedAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: nil)
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)

        present(alert, animated: true)
    }

    func displayStock() {
        strawberryCountLabel.text = String(store.displayStockCount()[0])
        bananaCountLabel.text = String(store.displayStockCount()[1])
        pineappleCountLabel.text = String(store.displayStockCount()[2])
        kiwiCountLabel.text = String(store.displayStockCount()[3])
        mangoCountLabel.text = String(store.displayStockCount()[4])
        
        
    }

}



// 주스 제조후에 나오는 얼럿 : 000 쥬스 나왔습니다! 맛있게 드세요! (확인)
// 주스 재고가 없는 경우 얼럿 : 재료가 모자라요 재고를 수정할까요? (예-재고수정화면이동/아니오-얼럿닫기)
