//
//  ModifyStocksViewController.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/16.
//

import UIKit

class ModifyStocksViewController: UIViewController {

    // MARK: - Outlet Property
    @IBOutlet weak var strawberryStepper: UIStepper!
    
    @IBOutlet weak var strawberryCountLabel: UILabel!
    @IBOutlet weak var bananaCountLabel: UILabel!
    @IBOutlet weak var pineappleCountLabel: UILabel!
    @IBOutlet weak var kiwiCountLabel: UILabel!
    @IBOutlet weak var mangoCountLabel: UILabel!
    
    // MARK: - Property
    var juiceMaker: JuiceMaker?
    private var fruitsLabels: [Fruit: UILabel] = [:]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setFruitLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        patchData()
    }
    
    // MARK: - func
    private func setFruitLabels() {
        fruitsLabels = [.strawberry: strawberryCountLabel,
                        .banana: bananaCountLabel,
                        .pineapple: pineappleCountLabel,
                        .kiwi: kiwiCountLabel,
                        .mango: mangoCountLabel]
    }
    
    private func patchData() {
        for fruitLabel in fruitsLabels {
            guard let fruitCount = juiceMaker?.fruitStore.stocks[fruitLabel.key] else {
                return
            }
            fruitLabel.value.text = "\(fruitCount)"
        }
    }
    
    // MARK: - Action
    @IBAction func closeButtonTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
