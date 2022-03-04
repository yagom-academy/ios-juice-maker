//  ViewController.swift
//  Created by Quokka, Donnie

import UIKit

final class JuiceStoreViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    @IBOutlet private var fruitStockLabels: [UILabel]!
    @IBOutlet private weak var strawberryBananaJuiceButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceButton: UIButton!
    @IBOutlet private weak var strawberryJuiceButton: UIButton!
    @IBOutlet private weak var bananaJuiceButton: UIButton!
    @IBOutlet private weak var pineappleJuiceButton: UIButton!
    @IBOutlet private weak var kiwiJuiceButton: UIButton!
    @IBOutlet private weak var mangoJuiceButton: UIButton!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitStockLabels()
    }
    
    private func updateFruitStockLabels() {
        fruitStockLabels.forEach ({
            guard let fruit = FruitStore.Fruit(rawValue: $0.tag) else { return }
            $0.text = juiceMaker.fruitStore.bringStockValue(for: fruit) })
    }
    
    @IBAction private func orderJuices(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else { return }
        do {
            try juiceMaker.makeJuice(juice)
            showSuccessAlert(of: juice)
        } catch {
            showFailureAlert()
        }
        updateFruitStockLabels()
    }
    
    @IBAction private func moveEditFruitStockViewController(_ sender: Any) {
        guard let fruitStockEditViewController = self.storyboard?.instantiateViewController(withIdentifier: FruitStockEditViewController.identifier) else { return }
        present(fruitStockEditViewController, animated: true, completion: nil)
    }
    
    private func showSuccessAlert(of juice: Juice) {
        let successAlert = UIAlertController(title: juice.name+AlertText.cameOut,
                                             message: AlertText.enjoyDrink,
                                            preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertText.check,
                                     style: .default,
                                     handler: nil)
        successAlert.addAction(okAction)
        present(successAlert, animated: true, completion: nil)
    }
    
    private func showFailureAlert() {
        let failureAlert = UIAlertController(title: AlertText.outOfStock,
                                             message: AlertText.editStock,
                                             preferredStyle: .alert)
        let okAction = UIAlertAction(title: AlertText.yes,
                                     style: .default) { action in
            self.moveEditFruitStockViewController(action)
        }
                                     
        let noAction = UIAlertAction(title: AlertText.no,
                                     style: .destructive,
                                     handler: nil)
        failureAlert.addAction(okAction)
        failureAlert.addAction(noAction)
        present(failureAlert, animated: true, completion: nil)
    }
}
