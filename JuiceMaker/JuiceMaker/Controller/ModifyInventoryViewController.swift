//
//  ModifyInventoryViewController.swift
//  JuiceMaker
//
//  Created by JeongTaek Han on 2021/10/26.
//

import UIKit

class ModifyInventoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        // Do any additional setup after loading the view.
        updateFruitCount()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateFruitCount),
            name: Notification.Name("changedInventory"),
            object: nil
        )
    }
    
    @IBOutlet var fruitCountLabels: [UILabel]!
    
    @objc
    func updateFruitCount() {
        let fruitCountList: [FruitStore.Fruits: Int] = FruitStore.shared.inventoryStatus
        
        for fruitCountLabel in fruitCountLabels {
            
            guard let fruitID = fruitCountLabel.restorationIdentifier else {
                return
            }
            
            guard let kindOfFruit = FruitStore.Fruits(rawValue: fruitID) else {
                return
            }
            
            guard let fruitCount = fruitCountList[kindOfFruit] else {
                return
            }
            
            fruitCountLabel.text = String(fruitCount)
        }
    }
    
    var myProperty: Double = 0.0 {
        didSet(oldVal) {
            print("\(self.myProperty) 와 \(oldVal) = \(self.myProperty - oldVal)" )
            
            if self.myProperty - oldVal > 0 {
                //add
                print("add")
            } else {
                //substract
                print("substract")
            }
        }
    }
    
    @IBAction func clickStepper(_ sender: UIStepper) {
        print("value: ",sender.value)
        print("stepValue: ",sender.stepValue)
        
        myProperty = sender.value
    }
    
}
