//
//  JuiceMaker - MainViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class MainViewController: UIViewController {
    private let store = FruitStore(stockCount: 10)
    private lazy var juiceMaker = JuiceMaker(store: store)
    
    @IBOutlet weak var strawberryBananaOrder: UIButton!
    @IBOutlet weak var mangoKiwiOrder: UIButton!
    @IBOutlet weak var strawberryOrder: UIButton!
    @IBOutlet weak var bananaOrder: UIButton!
    @IBOutlet weak var pineappleOrder: UIButton!
    @IBOutlet weak var kiwiOrder: UIButton!
    @IBOutlet weak var mangoOrder: UIButton!
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateStockCount()
    }
    
    @IBAction private func tappedModifyBarButton(_ sender: Any) {
        guard let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "EditNavigationController") as? UINavigationController else { return }
        navigationController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        navigationController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        guard let editViewController = navigationController.viewControllers.first as? EditViewController else { return }
        
        editViewController.setStore(from: store)
        
        present(navigationController, animated: true)
    }
    
    @IBAction private func tappedOrderButton(_ sender: UIButton) {
        var juice: Juice?
        
        switch sender {
        case strawberryBananaOrder:
            juice = .strawberryBananaJuice
        case mangoKiwiOrder:
            juice = .mangoKiwiJuice
        case strawberryOrder:
            juice = .strawberryJuice
        case bananaOrder:
            juice = .bananaJuice
        case pineappleOrder:
            juice = .pineappleJuice
        case kiwiOrder:
            juice = .kiwiJuice
        case mangoOrder:
            juice = .mangoJuice
        default:
            juice = nil
        }
        
        checkCanMakeJuice(juice)
    }
    
    private func checkCanMakeJuice(_ juice: Juice?) {
        guard let juice = juice else { return }
        
        if juiceMaker.makeJuice(juice) {
            updateStockCount()
            resultAlert(isSuccess: true, juiceName: juice.name)
        } else {
            resultAlert(isSuccess: false)
        }
    }
    
    private func resultAlert(isSuccess: Bool, juiceName: String = "") {
        let alert = UIAlertController(title: nil,
                                      message: isSuccess ? juiceName + AlertMesaage.successMesaage : AlertMesaage.failureMesaage,
                                      preferredStyle: .alert)
        let comfirmAction = UIAlertAction(title: isSuccess ? AlertMesaage.successComfirm : AlertMesaage.failureComfirm,
                                          style: .default,
                                          handler: isSuccess ? nil : { _ in self.tappedModifyBarButton(()) })
        
        alert.addAction(comfirmAction)
        
        if !isSuccess {
            let noAction = UIAlertAction(title: AlertMesaage.failureCencel, style: .cancel)
            alert.addAction(noAction)
        }
        
        present(alert, animated: true)
    }
    
    private func updateStockCount() {
        var newStock = store.stock
        
        for fruitCountLabel in fruitCountLabels {
            if newStock.isEmpty { return }
            fruitCountLabel.text = String(newStock.removeFirst())
        }
    }
}
