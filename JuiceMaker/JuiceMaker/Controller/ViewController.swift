//
//  JuiceMaker - ViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker(store: FruitStore(stockCount: 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func tappedButton(_ sender: Any) {
        
    }
    
    @IBAction func tappedOrderButton(_ sender: UIButton) {
        guard let juiceName = sender.restorationIdentifier else { return }
        guard let juice = Juice(rawValue: juiceName) else { return }
        
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
}

// 주스 제조후에 나오는 얼럿 : 000 쥬스 나왔습니다! 맛있게 드세요! (확인)
// 주스 재고가 없는 경우 얼럿 : 재료가 모자라요 재고를 수정할까요? (예-재고수정화면이동/아니오-얼럿닫기)
