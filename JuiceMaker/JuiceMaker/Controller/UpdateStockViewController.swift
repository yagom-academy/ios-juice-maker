//
//  UpdateStockViewController.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

final class UpdateStockViewController: UIViewController, StoryboardBindable {
    // MARK: - Views
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    var fruitStore: FruitStore?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateFruitStock()
    }
}

// MARK: - Setup
extension UpdateStockViewController {
    private func setupNavigationBar() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = .clear
    }
    
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func updateFruitStock() {
        guard let fruitStore: FruitStore = self.fruitStore else {
            return
        }
        self.strawberryStockLabel.text = "\(fruitStore.fruits[.strawberry, default: Number()])"
        self.bananaStockLabel.text = "\(fruitStore.fruits[.banana, default: Number()])"
        self.pineappleStockLabel.text = "\(fruitStore.fruits[.pineapple, default: Number()])"
        self.kiwiStockLabel.text = "\(fruitStore.fruits[.kiwi, default: Number()])"
        self.mangoStockLabel.text = "\(fruitStore.fruits[.mango, default: Number()])"
    }
}
