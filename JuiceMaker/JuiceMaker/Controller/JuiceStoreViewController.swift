//  ViewController.swift
//  Created by Quokka, Donnie

import UIKit

extension JuiceStoreViewController: FruitStockDelegate {
    func sendData(_ fruitsStock: [String]) {
        for index in fruitStockLabels.indices {
            fruitStockLabels[index].text = fruitsStock[index]
        }
        juiceMaker.fruitStore.updateStock(fruitsStock)
    }
}

final class JuiceStoreViewController: UIViewController {
    private let juiceMaker = JuiceMaker()
    @IBOutlet var fruitStockLabels: [UILabel]!
    
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
        guard let fruitStockEditViewController = self.storyboard?.instantiateViewController(withIdentifier: FruitStockEditViewController.identifier) as? FruitStockEditViewController else { return }
        appendFruitStock(to: fruitStockEditViewController)
        fruitStockEditViewController.delegate = self
        present(fruitStockEditViewController, animated: true, completion: nil)
    }
    
    private func appendFruitStock(to fruitStockEditVC: FruitStockEditViewController) {
        fruitStockEditVC.fruitsStock = juiceMaker.fruitStore.bringFruitsStock()
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
