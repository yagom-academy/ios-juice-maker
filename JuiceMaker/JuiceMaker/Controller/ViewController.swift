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
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func order(juice: JuiceMaker.Menu) {
        do {
            try juiceMaker.make(juice: juice)
            showSuccessAlert(message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!")
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
        let yesAction = UIAlertAction(title: "예", style: .default) {
            (action) in 
            let storyboard = self.storyboard!.instantiateViewController(identifier: "InventoryViewController")
            self.present(storyboard, animated: true, completion: nil)
        }
        
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func strawberryBananaJuiceOrderTapped(_ sender: UIButton) {
        order(juice: .strawberryBananaJuice)
    }
    
    @IBAction func mangoKiwiJuiceOrderTapped(_ sender: UIButton) {
        order(juice: .mangoKiwiJuice)
    }
    
    @IBAction func strawberryJuiceOrderTapped(_ sender: UIButton) {
        order(juice: .strawberryJuice)
    }
  
    @IBAction func bananaJuiceOrderTapped(_ sender: UIButton) {
        order(juice: .bananaJuice)
    }
    
    @IBAction func pineappleJuiceOrderTapped(_ sender: UIButton) {
        order(juice: .pineappleJuice)
    }
    
    @IBAction func kiwiJuiceOrderTapped(_ sender: UIButton) {
        order(juice: .kiwiJuice)
    }
 
    @IBAction func mangoJuiceOrderTapped(_ sender: UIButton) {
        order(juice: .mangoJuice)
    }
}

