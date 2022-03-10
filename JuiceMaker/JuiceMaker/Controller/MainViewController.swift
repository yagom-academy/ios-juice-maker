//
//  JuiceMaker - ViewController.swift
//  Created by safari and Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

protocol Updateable: AnyObject {
    func update(for stock: [Fruit: Int])
}

class MainViewController: UIViewController, Updateable {
    
    private var juiceMaker = JuiceMaker()
    
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
        guard let juice = matchJuice(with: button) else { return }
        if juiceMaker.canMake(of: juice) {
            juiceMaker.make(juice)
            showSuccessAlert(with: "\(juice)")
            updateStockLabel()
            
        } else {
            showFailureAlert()
        }
    }
    
    private func matchJuice(with button: UIButton) -> Juice? {
        switch button {
        case strawberryJuiceButton:
            return .strawberryJuice
        case bananaJuiceButton:
            return .bananaJuice
        case pineappleJuiceButton:
            return .pineappleJuice
        case kiwiJuiceButton:
            return .kiwiJuice
        case mangoJuiceButton:
            return .mangoJuice
        case strawberryAndBananaJuiceButton:
            return .strawberryAndBananaJuice
        case mangoAndKiwiJuiceButton:
            return .mangoAndKiwiJuice
        default:
            return nil
        }
    }
    
    private func updateStockLabel() {
        let store = juiceMaker.fruitStore
        strawberryLabel.text = store.getStock(of:.strawberry)
        bananaLabel.text = store.getStock(of:.banana)
        magoLabel.text = store.getStock(of:.mango)
        kiwiLabel.text = store.getStock(of:.kiwi)
        pineappleLabel.text = store.getStock(of:.pineapple)
    }
    
    private func showSuccessAlert(with juiceName: String) {
        let alertCountroll = UIAlertController(title: Phrases.noticeTitle.text, message: juiceName + Phrases.readyForJuice.text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Phrases.ok.text, style: .default, handler: nil )
        alertCountroll.addAction(okAction)
        present(alertCountroll, animated: false, completion: nil)
    }
    
    private func showFailureAlert() {
        let alertCountrol = UIAlertController(title: Phrases.noticeTitle.text, message: Phrases.questionForStockChange.text, preferredStyle: .alert)
        let moveAction = UIAlertAction(title: Phrases.yes.text, style: .default) {_ in
            guard let navigationC = self.moveManagingStockView() else { return }
            self.setUpDelegate(navigationC) }
        let cancelAction = UIAlertAction(title: Phrases.no.text, style: .destructive, handler: nil )
        alertCountrol.addAction(moveAction)
        alertCountrol.addAction(cancelAction)
        present(alertCountrol, animated: false, completion: nil)
    }
    
    @IBAction func touchUpMoveButton(_ sender: UIButton) {
        guard let navigationC = moveManagingStockView() else { return }
        setUpDelegate(navigationC)
    }
    
    private func setUpDelegate(_ viewNavigation: UINavigationController) {
        guard let topView = viewNavigation.topViewController as? Delegator else { return }
        topView.stock = juiceMaker.fruitStore.stock
        topView.delegate = self
    }
    
    private func moveManagingStockView() -> UINavigationController? {
        guard let managingStockVN = self.storyboard?.instantiateViewController(withIdentifier: "ManagingStockViewNavigation") as? UINavigationController else { return nil }
        self.present(managingStockVN, animated: true, completion: nil)
        return managingStockVN
    }
    
    func update(for stock: [Fruit: Int]) {
        juiceMaker.fruitStore.updateStock(to: stock)
        updateStockLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabel()
    }
    
}
