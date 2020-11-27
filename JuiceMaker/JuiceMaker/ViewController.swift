//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var strawberryStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var pineappleStock: UILabel!
    @IBOutlet weak var kiwiiStock: UILabel!
    @IBOutlet weak var mangoStock: UILabel!
    
    private var juiceMaker: JuiceMaker = JuiceMaker(stock: FruitStock(strawberry: 10, banana: 10, pineapple: 10, kiwii: 10, mango: 10))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureStockLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configureStockLabel() {
        strawberryStock.text = "\(juiceMaker.fruitStock.strawberry)"
        bananaStock.text = "\(juiceMaker.fruitStock.banana)"
        pineappleStock.text = "\(juiceMaker.fruitStock.pineapple)"
        kiwiiStock.text = "\(juiceMaker.fruitStock.kiwii)"
        mangoStock.text = "\(juiceMaker.fruitStock.mango)"
    }

    
    //MARK: - IBActions
    @IBAction func orderStrawberryBanana(_ sender: UIButton) {
    }
    @IBAction func orderMangoKiwii(_ sender: UIButton) {
    }
    @IBAction func orderStrawberry(_ sender: UIButton) {
    }
    @IBAction func orderBanana(_ sender: UIButton) {
    }
    @IBAction func orderPineApple(_ sender: UIButton) {
    }
    @IBAction func orderKiwii(_ sender: UIButton) {
    }
    @IBAction func orderMango(_ sender: UIButton) {
    }
}

