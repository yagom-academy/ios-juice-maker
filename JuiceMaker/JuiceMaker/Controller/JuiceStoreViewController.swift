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
        guard let fruitStockEditViewController = self.storyboard?
                .instantiateViewController(
                    withIdentifier: FruitStockEditViewController.identifier
                ) as? FruitStockEditViewController else { return }
        appendFruitStock(to: fruitStockEditViewController)
        fruitStockEditViewController.delegate = self
        present(fruitStockEditViewController, animated: true, completion: nil)
    }
    
    private func appendFruitStock(to fruitStockEditVC: FruitStockEditViewController) {
        fruitStockEditVC.fruitsStock = juiceMaker.fruitStore.bringFruitsStock()
    }
    
    private func showSuccessAlert(of juice: Juice) {
        AlertBuilder(viewController: self)
            .withTitle(juice.name + AlertText.cameOut)
            .andMessage(AlertText.enjoyDrink)
            .preferredStyle(.alert)
            .onSuccessAction(title: AlertText.check) { _ in }
            .show()
    }
    
    private func showFailureAlert() {
        AlertBuilder(viewController: self)
            .withTitle(AlertText.outOfStock)
            .andMessage(AlertText.editStock)
            .preferredStyle(.alert)
            .onSuccessAction(title: AlertText.yes) { action in
                self.moveEditFruitStockViewController(action)
            }
            .onCancelAction(title: AlertText.no) { _ in }
            .show()
    }
}
