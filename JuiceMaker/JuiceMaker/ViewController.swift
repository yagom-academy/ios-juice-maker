//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLable: UILabel!
    @IBOutlet weak var bananaStockLable: UILabel!
    @IBOutlet weak var pineappleStockLable: UILabel!
    @IBOutlet weak var kiwiStockLable: UILabel!
    @IBOutlet weak var mangoStockLable: UILabel!
    
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var BananaJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    @IBOutlet weak var mangokiwiJuiceOrderButton: UIButton!
    
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
    
    func showSuccessAlert(menu: Menu) {
        let orderSuccessMessage = menu.rawValue + AlertMessage.successMade.rawValue
        let alert = UIAlertController(title: "주문 성공", message: orderSuccessMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    func showOutOfStockAlert() {
        let alert = UIAlertController(title: "재고 부족", message: AlertMessage.outOfStock.rawValue, preferredStyle: .alert)
        let modifyStockAction = UIAlertAction(title: "YES", style: .default, handler: { (action) in
            
            let stockManagementView = self.storyboard!.instantiateViewController(withIdentifier: "StockMangement")
            
            self.present(stockManagementView, animated: true, completion: nil)
        })
        let cancelAction = UIAlertAction(title: "NO", style: .default, handler: nil)
        
        alert.addAction(modifyStockAction)
        alert.addAction(cancelAction)
        present(alert, animated: false, completion: nil)
    }
    
    func showMachineBreakdownAlert() {
        let alert = UIAlertController(title: "기계 고장", message: AlertMessage.machineBreakdown.rawValue, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    func makeOrderedJuice(menuName: Menu) {
        do {
            try JuiceMaker.common.makeJuice(selectedJuiceName: menuName)
            showSuccessAlert(menu: menuName)
        } catch AlertCase.outOfStock {
            showOutOfStockAlert()
        } catch {
            showMachineBreakdownAlert()
        }
        updateStock()
    }
    
    @IBAction func orderStrawberryJuice() {
        makeOrderedJuice(menuName: .strawberryJuice)
    }
    
    @IBAction func orderBananaJuice() {
        makeOrderedJuice(menuName: .bananaJuice)
    }
    
    @IBAction func orderStrawberryBananaJuice() {
        makeOrderedJuice(menuName: .strawberryBananaJuice)
    }
    
    @IBAction func orderPineappleJuice() {
        makeOrderedJuice(menuName: .pineappleJuice)
    }
    
    @IBAction func orderKiwiJuice() {
        makeOrderedJuice(menuName: .kiwiJuice)
    }
    
    @IBAction func orderMangoJuice() {
        makeOrderedJuice(menuName: .mangoJuice)
    }
    
    @IBAction func orderMangoKiwiJuice() {
        makeOrderedJuice(menuName: .mangoKiwiJuice)
    }
}
