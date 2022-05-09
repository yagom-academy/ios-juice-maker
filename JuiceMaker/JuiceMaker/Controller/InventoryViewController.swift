//
//  InventoryViewController.swift
//  JuiceMaker
//
//  Created by Minseong Kang on 2022/05/02.
//

import UIKit

class InventoryViewController: UIViewController {
    @IBOutlet private weak var strawberryInventoryLabel: UILabel!
    @IBOutlet private weak var bananaInventoryLabel: UILabel!
    @IBOutlet private weak var pineappleInventoryLabel: UILabel!
    @IBOutlet private weak var kiwiInventoryLabel: UILabel!
    @IBOutlet private weak var mangoInventoryLabel: UILabel!
    
    @IBOutlet private weak var strawberryInventoryStepper: UIStepper!
    @IBOutlet private weak var bananaInventoryStepper: UIStepper!
    @IBOutlet private weak var pineappleInventoryStepper: UIStepper!
    @IBOutlet private weak var kiwiInventoryStepper: UIStepper!
    @IBOutlet private weak var mangoInventoryStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
