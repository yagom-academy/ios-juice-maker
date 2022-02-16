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
        self.juiceMaker = JuiceMaker(fruitStore: FruitStore())
        super.init(coder: coder)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    // MARK: - Common Initialize
    
    private func commonInit() {
        self.setupRightBarButtonItem()
        self.addFruitStoreObserver()
    }
    
}

