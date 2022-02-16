//
//  JuiceMakerViewController.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

final class JuiceMakerViewController: UIViewController {
    // MARK: - Views
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    // MARK: - Properties
    private let fruitStore: FruitStore = FruitStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupFruitStock()
    }
    
    @IBAction func presentUpdateStockScene(_ sender: UIBarButtonItem) {
        let updateStockViewController: UpdateStockViewController = .instantiate()
        updateStockViewController.modalPresentationStyle = .fullScreen
        updateStockViewController.modalTransitionStyle = .coverVertical
        let navigationController: UINavigationController = UINavigationController(rootViewController: updateStockViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
}

// MARK: - Setup
extension JuiceMakerViewController {
    private func setupFruitStock() {
        self.strawberryStockLabel.text = "\(self.fruitStore.fruits[.strawberry, default: Number()])"
        self.bananaStockLabel.text = "\(self.fruitStore.fruits[.banana, default: Number()])"
        self.pineappleStockLabel.text = "\(self.fruitStore.fruits[.pineapple, default: Number()])"
        self.kiwiStockLabel.text = "\(self.fruitStore.fruits[.kiwi, default: Number()])"
        self.mangoStockLabel.text = "\(self.fruitStore.fruits[.mango, default: Number()])"
    }
}
