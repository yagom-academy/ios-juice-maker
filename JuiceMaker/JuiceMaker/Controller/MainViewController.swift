//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaButton: UIButton!
    @IBOutlet weak var mangoKiwiButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var mangoButton: UIButton!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var pineappleButton: UIButton!
    
    let maker = JuiceMaker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        strawberryBananaButton.tag = 1
        mangoKiwiButton.tag = 2
        strawberryButton.tag = 3
        bananaButton.tag = 4
        mangoButton.tag = 5
        kiwiButton.tag = 6
        pineappleButton.tag = 7
        
        updateUI()
    }
    
    @IBAction func makeJuiceAction(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.tag) else {
            NSLog("버튼 에러")
            return
        }
        
        if let result = maker.makeJuice(juice) {
            successAlert(result.description)
            updateUI()
        } else {
            failAlert()
        }
    }
    @IBAction func modifyStocks(_ sender: Any) {
        performSegue(withIdentifier: "showStock", sender: nil)
    }
}

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ModifyViewController
        vc?.store = maker.store
    }
    func updateUI() {
        strawberryLabel.text = String(maker.store.currentStock(.strawberry))
        bananaLabel.text = String(maker.store.currentStock(.banana))
        pineappleLabel.text = String(maker.store.currentStock(.pineapple))
        kiwiLabel.text = String(maker.store.currentStock(.kiwi))
        mangoLabel.text = String(maker.store.currentStock(.mango))
    }
    func successAlert(_ juiceName: String) {
        
    }
    func failAlert() {
        
    }
}

