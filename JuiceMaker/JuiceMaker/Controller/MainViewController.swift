//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var accessibilityButtons: [UIButton]!
    @IBOutlet var accessiblilityLabels: [UILabel]!
    
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var juiceMaker = JuiceMaker()
    var observation: [NSKeyValueObservation]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for eachButton in accessibilityButtons {
            eachButton.titleLabel?.adjustsFontForContentSizeCategory = true
        }
        for eachLabel in accessiblilityLabels {
            eachLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            eachLabel.adjustsFontForContentSizeCategory = true
        }
        strawberryLabel.accessibilityLabel = "🍓 재고"
        strawberryLabel.accessibilityValue = "\(strawberryLabel.text!) 개"
        bananaLabel.accessibilityLabel = "🍌 재고"
        bananaLabel.accessibilityValue = "\(bananaLabel.text!) 개"
        pineappleLabel.accessibilityLabel = "🍍 재고"
        pineappleLabel.accessibilityValue = "\(pineappleLabel.text!) 개"
        kiwiLabel.accessibilityLabel = "🥝 재고"
        kiwiLabel.accessibilityValue = "\(kiwiLabel.text!) 개"
        mangoLabel.accessibilityLabel = "🥭 재고"
        mangoLabel.accessibilityValue = "\(mangoLabel.text!) 개"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observation = [
            juiceMaker.fruitStore.observe(\.strawberry,options: [.new]){ _, _ in self.updateUILabel(.strawberry) },
            juiceMaker.fruitStore.observe(\.banana, options: [.new])    { _, _ in self.updateUILabel(.banana) },
            juiceMaker.fruitStore.observe(\.mango, options: [.new])     { _, _ in self.updateUILabel(.mango) },
            juiceMaker.fruitStore.observe(\.kiwi, options: [.new])      { _, _ in self.updateUILabel(.kiwi) },
            juiceMaker.fruitStore.observe(\.pineapple, options: [.new]) { _, _ in self.updateUILabel(.pineapple) }
        ]
        for fruit in Fruit.allCases {
            updateUILabel(fruit)
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observation = nil
    }
    
    @IBAction func oderJuiceAction(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            print("버튼 타이틀 에러입니다")
            return
        }
        guard let text = titleLabel.text, let juice = juiceMaker.menuOfJuice[text] else {
            print("쥬스 조회 에러")
            return
        }
        
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
        case .strawberry:
            strawberryLabel.text = String(juiceMaker.fruitStore[.strawberry])
            strawberryLabel.accessibilityValue = "\(strawberryLabel.text!) 개"
        case .banana:
            bananaLabel.text     = String(juiceMaker.fruitStore[.banana])
            bananaLabel.accessibilityValue = "\(bananaLabel.text!) 개"
        case .pineapple:
            pineappleLabel.text  = String(juiceMaker.fruitStore[.pineapple])
            pineappleLabel.accessibilityValue = "\(pineappleLabel.text!) 개"
        case .kiwi:
            kiwiLabel.text       = String(juiceMaker.fruitStore[.kiwi])
            kiwiLabel.accessibilityValue = "\(kiwiLabel.text!) 개"
        case .mango:
            mangoLabel.text      = String(juiceMaker.fruitStore[.mango])
            mangoLabel.accessibilityValue = "\(mangoLabel.text!) 개"
        }
    }
    func alertMakingJuiceResult(_ juiceName: String? = nil) {
        var alert = UIAlertController(), actions = Array<UIAlertAction>()
        var title = String(), message = String()
        if let name = juiceName {
            title = "음료 주문 성공"
            message = "\(name)쥬스 나왔습니다! 맛있게 드세요!"
            actions = [UIAlertAction(title: "예", style: .default)]
        } else {
            title = "음료 주문 실패"
            message = "재료가 모자라요. 재고를 수정할까요?"
            actions = [ UIAlertAction(title: "예", style: .default) { _ in
                self.performSegue(withIdentifier: "showStock", sender: self)
            }, UIAlertAction(title: "아니오", style: .default) ]
        }
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
}

