//
//  FruitQuantityViewController.swift
//  JuiceMaker
//
//  Created by 김우현 on 2023/09/19.
//

import UIKit

final class FruitQuantityViewController: UIViewController {
    static let id = String(describing: FruitQuantityViewController.self)
    
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var strawberryLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    
    private let juiceMaker = JuiceMaker()
    private let fruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideBackButton()
        updateStockToLabel()
    }
    
    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    func updateStockToLabel() {
        fruitStore.fruitQuantity.forEach{(key, value) in
            switch key {
            case .strawberry:
                strawberryLabel.text = String(value)
            case .banana:
                bananaLabel.text = String(value)
            case .kiwi:
                kiwiLabel.text = String(value)
            case .mango:
                mangoLabel.text = String(value)
            case .pineapple:
                pineappleLabel.text = String(value)
            }
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
