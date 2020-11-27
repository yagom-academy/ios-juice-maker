//
//  StockViewController.swift
//  JuiceMaker
//
//  Created by taetae on 2020/11/26.
//

import UIKit

class StockViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLable: UILabel!
    @IBOutlet weak var bananaStockLable: UILabel!
    @IBOutlet weak var pineappleStockLable: UILabel!
    @IBOutlet weak var kiwiStockLable: UILabel!
    @IBOutlet weak var mangoStockLable: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStock()
    }
    
    func updateStock() {
        strawberryStockLable.text = String(JuiceMaker.common.stockManager.strawberryInventoryAmount)
        bananaStockLable.text = String(JuiceMaker.common.stockManager.bananaInventoryAmount)
        pineappleStockLable.text = String(JuiceMaker.common.stockManager.pineappleInventoryAmount)
        kiwiStockLable.text = String(JuiceMaker.common.stockManager.kiwiInventoryAmount)
        mangoStockLable.text = String(JuiceMaker.common.stockManager.mangoInventoryAmount)
    }
    
    @IBAction func touchedCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
