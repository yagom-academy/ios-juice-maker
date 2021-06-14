//
//  ModifyViewController.swift
//  JuiceMaker
//
//  Created by Yongwoo Marco on 2021/06/08.
//

import UIKit

class ModifyViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    
    var store = FruitStore.shared
    var str = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryStepper.tag = 1
        bananaStepper.tag = 2
        mangoStepper.tag = 3
        kiwiStepper.tag = 4
        pineappleStepper.tag = 5
        
        NotificationCenter.default.addObserver(self,
                    selector: #selector(updateUI),
                    name: NSNotification.Name(rawValue: "updateUI"),
                    object: nil)
        print(str)
        print(store.fruitStocks)
        
        
        updateUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func updateUI() {
        do {
            strawberryLabel.text = String( try store.currentStock(.strawberry))
            bananaLabel.text = String( try store.currentStock(.banana))
            pineappleLabel.text = String( try store.currentStock(.pineapple))
            kiwiLabel.text = String( try store.currentStock(.kiwi))
            mangoLabel.text = String( try store.currentStock(.mango))
        } catch {
            print("UI 변경 실패")
        }
    }

    @IBAction func closeModifyView(_ sender: Any) {
        dismiss(animated: false)
    }
    
    @IBAction func valueChangedSteppers(_ sender: UIStepper) {
    }
    
}
