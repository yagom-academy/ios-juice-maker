//
//  JuiceMaker - ViewController.swift
//  Created by 써니쿠키, 써머캣
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()
    
    @IBOutlet weak var changeFruitStockButton: UIBarButtonItem!
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    
    lazy var fruitLabel: [Fruit: UILabel] = [
        .strawberry: strawberryStockLabel,
        .banana: bananaStockLabel,
        .pineapple: pineappleStockLabel,
        .kiwi: kiwiStockLabel,
        .mango: mangoStockLabel,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateFruitStockLabel()
    }
    
    func updateFruitStockLabel() {
        for (fruit, label) in fruitLabel {
            label.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
        }
    }
    
    @IBAction func orderJuice(sender: UIButton) {
        let juiceButton: [UIButton: Juice] = [
            strawberryBananaJuiceButton: .strawberryBananaJuice,
            mangoKiwiJuiceButton: .mangoKiwiJuice,
            strawberryJuiceButton: .strawberryJuice,
            bananaJuiceButton: .bananaJuice,
            pineappleJuiceButton: .pineappleJuice,
            kiwiJuiceButton: .kiwiJuice,
            mangoJuiceButton: .mangoJuice,
        ]
        
        guard let juice = juiceButton[sender] else { return }
        let result = juiceMaker.makeJuice(juice, total: 1)
        
        showAlert(result: result, juice: juice)
    }
    
    func showAlert(result: Result<String, Error>, juice: Juice) {
        let message = createAlertFor(result: result, juice: juice).message
        let okAction = createAlertFor(result: result, juice: juice).okAction
        let noAction = createAlertFor(result: result, juice: juice).noAction
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        alert.addAction(okAction)

        if let validNoAction = noAction {
            alert.addAction(validNoAction)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func createAlertFor(
        result: Result<String, Error>,
        juice: Juice
    ) -> (message: String, okAction: UIAlertAction, noAction: UIAlertAction?) {
        var okAction: UIAlertAction
        var noAction: UIAlertAction?
        var message: String
        
        switch result {
        case.success(let successMesssage):
            okAction = UIAlertAction(title: "예", style: .default, handler : nil)
            noAction = nil
            message = successMesssage
            updateFruitStockLabelUsedFor(juice)
        case .failure(let error):
            if let juiceMakerError = error as? JuiceMakerError {
                message = juiceMakerError.errorDescription
            } else {
                message = error.localizedDescription
            }
            okAction = UIAlertAction(title: "예", style: .default) { _ in
                self.moveToFruitStockVC()
            }
            noAction = UIAlertAction(title: "아니오", style: .destructive, handler: nil)
        }
        
        return (message: message, okAction: okAction, noAction: noAction)
    }
    
    func updateFruitStockLabelUsedFor(_ juice: Juice) {
        for fruit in juice.recipe.keys {
            guard let validLabel = fruitLabel[fruit] else { return }
            
            validLabel.text = String(FruitStore.sharedFruitStore.fetchStockOf(fruit))
        }
    }
    
    @IBAction func touchUpChangeFruitStockButton(_ sender: UIBarButtonItem) {
        moveToFruitStockVC()
    }
    
    func moveToFruitStockVC() {
        guard let fruitStoreStockVC = self.storyboard?.instantiateViewController(withIdentifier: "fruitStoreStock") as? FruitStockViewController else {return}
        
        let fruitStockNC = UINavigationController.init(rootViewController: fruitStoreStockVC)
        
        fruitStockNC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        self.present(fruitStockNC, animated: true, completion: nil)
    }
}

