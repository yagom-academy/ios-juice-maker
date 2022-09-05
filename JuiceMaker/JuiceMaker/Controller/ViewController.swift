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
    }

}

// 주스 제조후에 나오는 얼럿 : 000 쥬스 나왔습니다! 맛있게 드세요! (확인)
// 주스 재고가 없는 경우 얼럿 : 재료가 모자라요 재고를 수정할까요? (예-재고수정화면이동/아니오-얼럿닫기)
