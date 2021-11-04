//
//  StockUpdateController.swift
//  JuiceMaker
//
//  Created by 권나영 on 2021/10/28.
//

import UIKit

class StockUpdateController: UIViewController {
    
    @IBOutlet private weak var strawberryLabel: UILabel!
    @IBOutlet private weak var bananaLabel: UILabel!
    @IBOutlet private weak var pineappleLabel: UILabel!
    @IBOutlet private weak var kiwiLabel: UILabel!
    @IBOutlet private weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    var stockOfFruit: [Fruit: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStockOfFruitLabel()
        setStock()
    }
    
    func setStockOfFruitLabel() {
        stockOfFruit.forEach({ (fruit, stock) in
            switch fruit {
            case .strawberry:
                strawberryLabel.text = String(stock)
            case .banana:
                bananaLabel.text = String(stock)
            case .pineapple:
                pineappleLabel.text = String(stock)
            case .kiwi:
                kiwiLabel.text = String(stock)
            case .mango:
                mangoLabel.text = String(stock)
            }
        })
    }
    
    func updateModel() {
        stockOfFruit[.strawberry] = Int(strawberryStepper.value)
        stockOfFruit[.banana] = Int(bananaStepper.value)
        stockOfFruit[.pineapple] = Int(pineappleStepper.value)
        stockOfFruit[.kiwi] = Int(kiwiStepper.value)
        stockOfFruit[.mango] = Int(mangoStepper.value)
    }
    
    @IBAction func tapFruitStepper(_ sender: UIStepper) {
        do {
            guard let fruit = Fruit(rawValue: sender.tag) else {
                throw JuiceMakerError.invalidTagNumberForStepper
            }
            let stepperValue = Int(sender.value)
            updateFruitLabel(for: fruit, stock: stepperValue)
        } catch JuiceMakerError.invalidTagNumberForStepper {
            print(JuiceMakerError.invalidTagNumberForStepper.description)
        } catch {
            print(error)
        }
    }
    
    func setStock() {
        stockOfFruit.forEach({ (fruit, stock) in
            switch fruit {
            case .strawberry:
                strawberryLabel.text = String(stock)
                strawberryStepper.value = Double(stock)
            case .banana:
                bananaLabel.text = String(stock)
                bananaStepper.value = Double(stock)
            case .pineapple:
                pineappleLabel.text = String(stock)
                pineappleStepper.value = Double(stock)
            case .kiwi:
                kiwiLabel.text = String(stock)
                kiwiStepper.value = Double(stock)
            case .mango:
                mangoLabel.text = String(stock)
                mangoStepper.value = Double(stock)
            }
        })
    }
    
    func updateFruitLabel(for fruit: Fruit, stock: Int) {
        switch fruit {
        case .strawberry:
            strawberryLabel.text = String(stock)
        case .banana:
            bananaLabel.text = String(stock)
        case .pineapple:
            pineappleLabel.text = String(stock)
        case .kiwi:
            kiwiLabel.text = String(stock)
        case .mango:
            mangoLabel.text = String(stock)
        }
    }

    @IBAction func tapExitButton(_ sender: UIBarButtonItem) {
        updateModel()
        notificationCenter.post(name: Notification.Name.stockModified,
                                object: nil,
                                userInfo: [NotificationKey.stockOfFruit: self.stockOfFruit])
        dismiss(animated: true, completion: nil)
    }
}
