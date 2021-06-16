//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var juiceMaker = JuiceMaker()
    var observation = [NSKeyValueObservation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        observation = [
            juiceMaker.fruitStore.observe(\.strawberry, options: [.new]) { _, _ in self.updateUILabel(.strawberry) },
            juiceMaker.fruitStore.observe(\.banana, options: [.new]) { _, _ in self.updateUILabel(.banana) },
            juiceMaker.fruitStore.observe(\.mango, options: [.new]) { _, _ in self.updateUILabel(.mango) },
            juiceMaker.fruitStore.observe(\.kiwi, options: [.new]) { _, _ in self.updateUILabel(.kiwi) },
            juiceMaker.fruitStore.observe(\.pineapple, options: [.new]) { _, _ in self.updateUILabel(.pineapple) }
        ]
        for fruit in Fruit.allCases {
            updateUILabel(fruit)
        }
    }
    
    @IBAction func makeJuiceAction(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else { print("버튼 타이틀 에러"); return }
        guard let text = titleLabel.text, let juice = Juice(rawValue: text) else { print("쥬스 조회 에러"); return }
        juiceMaker.makeJuice(juice) { getResult in
            switch getResult {
            case .success(let juiceName):
                self.alertMakingJuiceResult(juiceName)
            case .failure(let error):
                self.alertMakingJuiceResult()
                print(error)
            }
        }
    }
    @IBAction func moveToModifyView(_ sender: Any) {
        performSegue(withIdentifier: "showStock", sender: sender)
    }
    
    func updateUILabel(_ fruit: Fruit) {
        switch fruit {
        case .strawberry:   strawberryLabel.text = String(juiceMaker.fruitStore[.strawberry])
        case .banana:       bananaLabel.text = String(juiceMaker.fruitStore[.banana])
        case .pineapple:    pineappleLabel.text = String(juiceMaker.fruitStore[.pineapple])
        case .kiwi:         kiwiLabel.text = String(juiceMaker.fruitStore[.kiwi])
        case .mango:        mangoLabel.text = String(juiceMaker.fruitStore[.mango])
        }
    }
    func alertMakingJuiceResult(_ juiceName: String? = nil) {
        var alert = UIAlertController()
        var actions = Array<UIAlertAction>()
        if let name = juiceName {
            alert = UIAlertController(title: "음료 주문 성공", message: "\(name)쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
            actions = [UIAlertAction(title: "예", style: .default)]
        } else {
            alert = UIAlertController(title: "음료 주문 실패", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
            actions = [ UIAlertAction(title: "예", style: .default) { _ in
                self.performSegue(withIdentifier: "showStock", sender: self)
            }, UIAlertAction(title: "아니오", style: .default) ]
            
        }
        _ = actions.map({ alert.addAction($0) })
        present(alert, animated: true, completion:nil)
    }
}

