//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!

    let maker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func juiceOrder(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else { print("버튼 타이틀 에러"); return }
        guard let text = titleLabel.text, let juice = Juice(rawValue: text) else { print("쥬스 구분실패"); return }
//        print(juice)
        maker.makeJuice(juice)
    }
    
}

extension MainViewController {
    func successAlert() {
        let alert = UIAlertController(title: "*** 쥬스 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "감사합니다.", style: .default)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    func failAlert() {
        let alert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "예", style: .default){ _ in print("예 선택")}
        let cancelAction = UIAlertAction(title: "아니오", style: .default){ _ in print("아니오 선택")}
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
}
