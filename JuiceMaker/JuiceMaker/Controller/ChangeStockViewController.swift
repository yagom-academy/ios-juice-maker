//  JuiceMaker - ChangeStockViewController.swift
//  Created by 송준, Rowan on 2023/01/05.
//  Copyright © yagom academy. All rights reserved.

import UIKit

final class ChangeStockViewController: UIViewController {
    
    private var fruitsStock: [Fruits: Int] {
        return FruitStore.shared.fruitsStock
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayStock()
        initializeSteppers()
        setUpNavigationItem()
    }
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var stockOfStrawberry: UILabel!
    @IBOutlet weak var stockOfBanana: UILabel!
    @IBOutlet weak var stockOfPineapple: UILabel!
    @IBOutlet weak var stockOfKiwi: UILabel!
    @IBOutlet weak var stockOfMango: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    @IBOutlet var steppers: [UIStepper]!
    
    func displayStock() {
        if let strawberryStock = fruitsStock[.strawberry],
           let bananaStock = fruitsStock[.banana],
           let pineappleStock = fruitsStock[.pineapple],
           let kiwiStock = fruitsStock[.kiwi],
           let mangoStock = fruitsStock[.mango] {
            stockOfStrawberry.text = String(strawberryStock)
            stockOfBanana.text = String(bananaStock)
            stockOfPineapple.text = String(pineappleStock)
            stockOfKiwi.text = String(kiwiStock)
            stockOfMango.text = String(mangoStock)
        }
    }
    
    func initializeSteppers() {
        for stepper in steppers {
            if let selectedFruit = identifyRelatedFruit(of: stepper),
               let initialValue = fruitsStock[selectedFruit] {
                stepper.transform = stepper.transform.scaledBy(x: 1.0, y: 1.0)
                stepper.value = Double(initialValue)
            }
        }
    }
    
    func identifyRelatedFruit(of stepper: UIStepper) -> Fruits? {
        switch stepper {
        case strawberryStepper: return .strawberry
        case bananaStepper: return .banana
        case pineappleStepper: return .pineapple
        case kiwiStepper: return .kiwi
        case mangoStepper: return .mango
        default: return nil
        }
    }
    
    func setUpNavigationItem() {
        navigationBar.title = "재고 추가"
        let dismissButton = UIBarButtonItem(title: "닫기",
                                            style: .plain,
                                            target: self,
                                            action: #selector(dismissCurrentView))
        navigationBar.rightBarButtonItem = dismissButton
    }
    
    @objc func dismissCurrentView() {
        self.dismiss(animated: true)
    }

    @IBAction func pushStepper(_ sender: UIStepper) {
        guard let fruitsLabel = identifyRelatedLabel(of: sender),
              let fruit = identifyRelatedFruit(of: sender) else { return }
        
        FruitStore.shared.fruitsStock[fruit] = Int(sender.value)
        fruitsLabel.text = Int(sender.value).description
        center.post(name: Notification.Name.fruitStockChanged, object: nil)
    }
    
    func identifyRelatedLabel(of stepper: UIStepper) -> UILabel? {
        switch stepper {
        case strawberryStepper: return stockOfStrawberry
        case bananaStepper: return stockOfBanana
        case pineappleStepper: return stockOfPineapple
        case kiwiStepper: return stockOfKiwi
        case mangoStepper: return stockOfMango
        default: return nil
        }
    }
    
    
}
