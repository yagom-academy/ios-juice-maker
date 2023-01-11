//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by riji, kaki on 2023/01/09.
//

import UIKit

final class ManageStockViewController: UIViewController {

    @IBOutlet weak private var strawberryStockLabel: UILabel!
    @IBOutlet weak private var bananaStockLabel: UILabel!
    @IBOutlet weak private var pineappleStockLabel: UILabel!
    @IBOutlet weak private var kiwiStockLabel: UILabel!
    @IBOutlet weak private var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    private let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateStockLabel()
        initTitle()
        setStepper()
    }
    
    private func updateStockLabel() {
        strawberryStockLabel.text = juiceMaker.currentFruitStock(of: .strawberry)
        bananaStockLabel.text = juiceMaker.currentFruitStock(of: .banana)
        pineappleStockLabel.text = juiceMaker.currentFruitStock(of: .pineapple)
        kiwiStockLabel.text = juiceMaker.currentFruitStock(of: .kiwi)
        mangoStockLabel.text = juiceMaker.currentFruitStock(of: .mango)
    }
    
    private func initTitle() {
        let navigationTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        navigationTitle.numberOfLines = 1
        navigationTitle.textAlignment = .center
        navigationTitle.font = UIFont.systemFont(ofSize: 30)
        navigationTitle.text = "재고 추가"
        
        self.navigationItem.titleView = navigationTitle
    }
    
    @IBAction private func closeViewBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setStepper() {
        strawberryStepper.autorepeat = true

        guard let value = FruitStore.sharedFruitStore.fruitStocks[.strawberry] else {
            return
        }
        strawberryStepper.value = Double(value)
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        strawberryStockLabel.text = Int(sender.value).description
        
        FruitStore.sharedFruitStore.fruitStocks[.strawberry] = Int(sender.value)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name("dismiss"), object: nil)
    }
}
