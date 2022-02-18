//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by Haeseok Lee on 2022/02/15.
//

import UIKit

protocol StockManagementVCDelegate: AnyObject {
    func touchUpCloseButton()
}

final class StockManagementViewController: UIViewController {
    
    @IBOutlet private weak var strawberryCountLabel: UILabel!
    @IBOutlet private weak var bananaCountLabel: UILabel!
    @IBOutlet private weak var pineappleCountLabel: UILabel!
    @IBOutlet private weak var kiwiCountLabel: UILabel!
    @IBOutlet private weak var mangoCountLabel: UILabel!
    @IBOutlet private weak var strawberryStepper: UIStepper!
    @IBOutlet private weak var bananaStepper: UIStepper!
    @IBOutlet private weak var pineappleStepper: UIStepper!
    @IBOutlet private weak var kiwiStepper: UIStepper!
    @IBOutlet private weak var mangoStepper: UIStepper!
    
    var fruitStore: FruitStore?
    weak var delegate: StockManagementVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStockManagementVC()
        setupNavigationBar()
    }
    
    private func setupStockManagementVC() {
        guard let fruitStore = fruitStore else { return }
        updateFruitLabels(fruitStore: fruitStore)
        setupFruitSteppers()
        updateFruitSteppers(fruitStore: fruitStore)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "재고 추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "닫기",
            style: .plain,
            target: self,
            action: #selector(touchUpCloseRightBarButton)
        )
    }
    
    private func updateFruitLabels(fruitStore: FruitStore) {
        strawberryCountLabel.text = "\(fruitStore.strawberry.counter)"
        bananaCountLabel.text = "\(fruitStore.banana.counter)"
        pineappleCountLabel.text = "\(fruitStore.pineapple.counter)"
        kiwiCountLabel.text = "\(fruitStore.kiwi.counter)"
        mangoCountLabel.text = "\(fruitStore.mango.counter)"
    }
    
    private func setupFruitSteppers() {
        strawberryStepper.tag = Constants.Tag.strawberry
        bananaStepper.tag = Constants.Tag.banana
        pineappleStepper.tag = Constants.Tag.pineapple
        kiwiStepper.tag = Constants.Tag.kiwi
        mangoStepper.tag = Constants.Tag.mango
    }
    
    private func updateFruitSteppers(fruitStore: FruitStore) {
        strawberryStepper.value = Double(fruitStore.strawberry.counter)
        bananaStepper.value = Double(fruitStore.banana.counter)
        pineappleStepper.value = Double(fruitStore.pineapple.counter)
        kiwiStepper.value = Double(fruitStore.kiwi.counter)
        mangoStepper.value = Double(fruitStore.mango.counter)
    }
    
    private func valueChangedStepper(sender: UIStepper) {
        guard let fruitStore = fruitStore else { return }
        switch sender.tag {
        case Constants.Tag.strawberry:
            fruitStore.update(fruitType: Strawberry.self, num: Int(sender.value))
        case Constants.Tag.banana:
            fruitStore.update(fruitType: Banana.self, num: Int(sender.value))
        case Constants.Tag.pineapple:
            fruitStore.update(fruitType: Pineapple.self, num: Int(sender.value))
        case Constants.Tag.kiwi:
            fruitStore.update(fruitType: Kiwi.self, num: Int(sender.value))
        case Constants.Tag.mango:
            fruitStore.update(fruitType: Mango.self, num: Int(sender.value))
        default:
            return
        }
        updateFruitLabels(fruitStore: fruitStore)
    }
    
    @objc private func touchUpCloseRightBarButton() {
        delegate?.touchUpCloseButton()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func valueChangedStrawberryStepper(_ sender: UIStepper) {
        valueChangedStepper(sender: sender)
    }
    
    @IBAction func valueChangedBananaStepper(_ sender: UIStepper) {
        valueChangedStepper(sender: sender)
    }
    
    @IBAction func valueChangedPineappleStepper(_ sender: UIStepper) {
        valueChangedStepper(sender: sender)
    }
    
    @IBAction func valueChangedKiwiStepper(_ sender: UIStepper) {
        valueChangedStepper(sender: sender)
    }
    
    @IBAction func valueChangedMangoStepper(_ sender: UIStepper) {
        valueChangedStepper(sender: sender)
    }
}
