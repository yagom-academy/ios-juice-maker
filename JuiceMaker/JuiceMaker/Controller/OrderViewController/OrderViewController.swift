//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class OrderViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    // MARK: - Property
    
    var juiceMaker: JuiceMaker
    
    // MARK: - Initialize

    required init?(coder: NSCoder) {
        print(#function)
        self.juiceMaker = JuiceMaker(fruitStore: FruitStore())
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightBarButtonItem()
        self.addFruitStoreObserver()
    }
    
}

extension OrderViewController {
    
    private func addFruitStoreObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didChangeStock),
            name: .didChangeStock,
            object: nil
        )
    }
    
    @objc private func didChangeStock() {
        let stocks = self.juiceMaker.fruitStore.store
        
        stocks.forEach { fruit, currentCount in
            let label = self.getCountLabel(of: fruit)
            DispatchQueue.main.async {
                label.text = "\(currentCount)"
            }
        }
    }
    
    private func getCountLabel(of fruit: Fruit) -> UILabel {
        switch fruit {
        case .strawberry:
            return self.strawberryCountLabel
        case .banana:
            return self.bananaCountLabel
        case .pineapple:
            return self.pineappleCountLabel
        case .kiwi:
            return self.kiwiCountLabel
        case .mango:
            return self.mangoCountLabel
        }
    }
}
