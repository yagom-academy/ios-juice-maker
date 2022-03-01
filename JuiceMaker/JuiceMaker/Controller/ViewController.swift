//
//  JuiceMaker - ViewController.swift
//  Created by safari and Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var fruitStore = FruitStore.fruitStore
    var juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var magoLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var strawberryAndBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoAndKiwiJuiceButton: UIButton!
    
    @IBAction func orderButton(_ sender: UIButton) {
        guard let juice = matchButtonToJuice(sender) else { return }
        let okay = chekcError(juice)
        updateFruitLable()
        showAlert(alertMessage: "\(okay)")
    }
    
    func matchButtonToJuice(_ button: UIButton) -> JuiceMaker.Juice? {
        var juice: JuiceMaker.Juice?
        switch button {
        case strawberryJuiceButton:
            juice = .strawberryJuice
        case bananaJuiceButton:
            juice = .bananaJuice
        case pineappleJuiceButton:
            juice = .pineappleJuice
        case kiwiJuiceButton:
            juice = .kiwiJuice
        case mangoJuiceButton:
            juice = .mangoJuice
        case strawberryAndBananaJuiceButton:
            juice = .strawberryAndBananaJuice
        case mangoAndKiwiJuiceButton:
            juice = .mangoAndKiwiJuice
        default:
            juice = nil
        }
        return juice
    }
        
    
    func updateFruitLable() {
        strawberryLabel.text = String(fruitStore.getStock(of: .strawberry))
        bananaLabel.text = String(fruitStore.getStock(of: .banana))
        pineappleLabel.text = String(fruitStore.getStock(of: .pineapple))
        kiwiLabel.text = String(fruitStore.getStock(of: .kiwi))
        magoLabel.text = String(fruitStore.getStock(of: .mango))
    }
    
    func chekcError(_ juice: JuiceMaker.Juice) -> Bool {
        do {
            try juiceMaker.takeOrder(juice)
        } catch {
            return false
        }
        return true
    }
    
    func showAlert(alertMessage: String) {
        let alertCountroll = UIAlertController(title: "알림", message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil )
        let moveAction = UIAlertAction(title: "예", style: .default, handler: { _ in self.moveStockCorrectionView() })
        let cancelAction = UIAlertAction(title: "아니오", style: .default, handler: nil )
        
        if alertMessage == "재료가 모자라요. 재고를 수정할까요?" {
            alertCountroll.addAction(moveAction)
            alertCountroll.addAction(cancelAction)
        } else {
            alertCountroll.addAction(okAction)
        }
        present(alertCountroll, animated: false, completion: nil)
    }
    
    @IBAction func clickStockCorrectionButton(_ sender: UIButton) {
        moveStockCorrectionView()
    }
    
    func moveStockCorrectionView() {
        let stockCorrectionView = self.storyboard?.instantiateViewController(withIdentifier: "stockCorrection")
        stockCorrectionView?.modalTransitionStyle = .coverVertical
        stockCorrectionView?.modalPresentationStyle = .automatic
        self.present(stockCorrectionView!, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLable()
        
        // Do any additional setup after loading the view.
    }
}
