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
    
    var store = FruitStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    func updateUI() {
        strawberryLabel.text = String(store.currentStock(.strawberry))
        bananaLabel.text = String(store.currentStock(.banana))
        pineappleLabel.text = String(store.currentStock(.pineapple))
        kiwiLabel.text = String(store.currentStock(.kiwi))
        mangoLabel.text = String(store.currentStock(.mango))
    }

}
