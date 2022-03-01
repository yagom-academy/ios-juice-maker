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
    
    @IBAction func orderJuice(with button: UIButton) {
        guard let juice = matchButtonToJuice(button) else { return }
        if juiceMaker.orderAndCheck(juice) {
            showSuccessAlert(with: juice.koreanName)
        } else {
            showFailureAlert()
        }
        updateFruitLable()
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
    
    func showSuccessAlert(with juiceName: String) {
        let alertCountroll = UIAlertController(title: Phrases.noticeTitle.text, message: juiceName + Phrases.readyForJuice.text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Phrases.ok.text, style: .default, handler: nil )
        alertCountroll.addAction(okAction)
        present(alertCountroll, animated: false, completion: nil)
    }
    
    func showFailureAlert() {
        let alertCountrol = UIAlertController(title: Phrases.noticeTitle.text, message: Phrases.questionForStockChange.text, preferredStyle: .alert)
        let moveAction = UIAlertAction(title: Phrases.yes.text, style: .default, handler: { _ in self.moveStockChangeView() })
        let cancelAction = UIAlertAction(title: Phrases.no.text, style: .default, handler: nil )
        alertCountrol.addAction(moveAction)
        alertCountrol.addAction(cancelAction)
        present(alertCountrol, animated: false, completion: nil)
    }
    
    
    @IBAction func clickStockChangeButton(_ sender: UIButton) {
        moveStockChangeView()
    }
    
    func moveStockChangeView() {
        let stockChangeView = self.storyboard?.instantiateViewController(withIdentifier: "stockChange")
        stockChangeView?.modalTransitionStyle = .coverVertical
        stockChangeView?.modalPresentationStyle = .automatic
        self.present(stockChangeView!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitLable()
        
        // Do any additional setup after loading the view.
    }
}
