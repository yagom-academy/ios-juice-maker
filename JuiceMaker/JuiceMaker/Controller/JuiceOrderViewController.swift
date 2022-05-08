//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    @IBOutlet weak var strawberryInventoryLabel: UILabel!
    @IBOutlet weak var bananaInventoryLabel: UILabel!
    @IBOutlet weak var pineappleInventoryLabel: UILabel!
    @IBOutlet weak var kiwiInventoryLabel: UILabel!
    @IBOutlet weak var mangoInventoryLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsInventoryLabels()
    }
    
    func updateFruitsInventoryLabels() {
        let errorValue = 999
        strawberryInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? errorValue)
        bananaInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.banana] ?? errorValue)
        pineappleInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.pineapple] ?? errorValue)
        kiwiInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.kiwi] ?? errorValue)
        mangoInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.mango] ?? errorValue)
    }
    
    private func order(juice: JuiceMaker.Menu) {
        do {
            try JuiceMaker.shared.make(juice: juice)
            showSuccessAlert(message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!")
            updateFruitsInventoryLabels()
        } catch {
            showFailureAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "고마워요 😘", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFailureAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] (action) in
            guard let storyboard = self?.storyboard?.instantiateViewController(identifier: "InventoryViewController") else {
                return
            }
            self?.present(storyboard, animated: true, completion: nil)
        }
        
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tapJuiceOrderButton(_ sender: UIButton) {
        // 딕셔너리만 사용
        let IBOutlets = [strawberryBananaJuiceOrderButton: JuiceMaker.Menu.strawberryBananaJuice,
                         mangoKiwiJuiceOrderButton:JuiceMaker.Menu.mangoKiwiJuice,
                         strawberryJuiceOrderButton:JuiceMaker.Menu.strawberryJuice,
                         bananaJuiceOrderButton:JuiceMaker.Menu.bananaJuice,
                         pineappleJuiceOrderButton:JuiceMaker.Menu.pineappleJuice,
                         kiwiJuiceOrderButton:JuiceMaker.Menu.kiwiJuice,
                         mangoJuiceOrderButton:JuiceMaker.Menu.mangoJuice]
        guard let juice =  IBOutlets[sender] else { return }
        order(juice: juice)
        
 
        // extension해서 생성한 함수 + 딕셔너리 사용
//        guard let menu = sender.test(IBOutlets: IBOutlets) else { return }
//        order(juice:menu)

        
        // tag 사용
//        let juice = sender.id
//        order(juice: juice)
        
        
        // 기존 코드
//        switch sender {
//        case strawberryBananaJuiceOrderButton:
//            order(juice: .strawberryBananaJuice)
//        case mangoKiwiJuiceOrderButton:
//            order(juice: .mangoKiwiJuice)
//        case strawberryJuiceOrderButton:
//            order(juice: .strawberryJuice)
//        case bananaJuiceOrderButton:
//            order(juice: .bananaJuice)
//        case pineappleJuiceOrderButton:
//            order(juice: .pineappleJuice)
//        case kiwiJuiceOrderButton:
//            order(juice: .kiwiJuice)
//        default:
//            order(juice: .mangoJuice)
//        }
    }
}

extension UIButton {
//  🤨 함수 사용 방법
    func test(IBOutlets: [UIButton?:JuiceMaker.Menu]) -> JuiceMaker.Menu? {
        var menu: JuiceMaker.Menu? = nil
        IBOutlets.forEach {
            if $0.key == self {
                menu = $0.value
            }
        }
        return menu
    }
    
//  😢 tag 사용 방법
    var id: JuiceMaker.Menu {
        let tag = self.tag
        
        switch tag {
        case 0:
            return .strawberryBananaJuice
        case 1:
            return .mangoKiwiJuice
        case 2:
            return .strawberryJuice
        case 3:
            return .bananaJuice
        case 4:
            return .pineappleJuice
        case 5:
            return .kiwiJuice
        default:
            return .mangoJuice
        }
    }
}
