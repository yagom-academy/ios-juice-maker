//
//  ModalViewController.swift
//  JuiceMaker
//
//  Created by jiinheo on 2022/02/17.
//

import UIKit

class ModalViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshQuantity()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    private func refreshQuantity() {
        guard let juiceMaker = juiceMaker else {
            return
        }

        strawberryLabel.text = String(juiceMaker.quantity(of: .strawberry))
        bananaLabel.text = String(juiceMaker.quantity(of: .banana))
        pineappleLabel.text = String(juiceMaker.quantity(of: .pineapple))
        kiwiLabel.text = String(juiceMaker.quantity(of: .kiwi))
        mangoLabel.text = String(juiceMaker.quantity(of: .mango))
    }
}
