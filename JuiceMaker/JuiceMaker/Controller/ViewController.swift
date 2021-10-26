//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    let juiceMaker = JuiceMaker()
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        guard let orderedJuice = takeJuiceOrder(from: sender) else {
            return
        }
        do {
            try juiceMaker.make(juice: orderedJuice)
            presentMakeJuiceSuccessAlert(juice: orderedJuice)
        } catch ServiceError.notEnoughStock {
            presentNotEnoughStockAlert()
        } catch SystemError.invaildKey {
            print(SystemError.invaildKey.errorDescription)
        } catch {
            print(error)
        }
    
    }
    
    func takeJuiceOrder(from button: UIButton) -> JuiceMaker.Juice? {
        switch button {
        case strawberryBananaJuiceOrderButton:
            return .strawberryAndBananaJuice
        case strawberryJuiceOrderButton:
            return .strawberryJuice
        case bananaJuiceOrderButton:
            return .bananaJuice
        case mangoKiwiJuiceOrderButton:
            return .mangoKiwiJuice
        case pineappleJuiceOrderButton:
            return .pineappleJuice
        case kiwiJuiceOrderButton:
            return .kiwiJuice
        case mangoJuiceOrderButton:
            return .mangoJuice
        default:
            return nil
        }
    }
    
    func presentMakeJuiceSuccessAlert(juice: JuiceMaker.Juice) {
        let successAlert = UIAlertController(title: "\(juice.description) 나왔습니다! 맛있게 드세요!", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default)
        
        successAlert.addAction(confirmAction)
        
        self.present(successAlert, animated: true, completion: nil)
    }
    
    func presentNotEnoughStockAlert(){
        let notEnoughStockAlert = UIAlertController(title: "재료가 모자라요. 재고를 수정할까요?", message: nil, preferredStyle: .alert)
        let modifyStockAction = UIAlertAction(title: "재고 수정", style: .default) { _ in
            self.performSegue(withIdentifier: "showModifyStock", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .destructive)
        
        notEnoughStockAlert.addAction(modifyStockAction)
        notEnoughStockAlert.addAction(cancelAction)
        
        self.present(notEnoughStockAlert, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

