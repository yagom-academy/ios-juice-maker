//
//  FruitStoreViewController.swift
//  JuiceMaker
//
//  Created by EtialMoon, 비모 on 2023/05/16.
//

import UIKit

protocol FruitStoreDelegate: AnyObject {
    func changeStock()
}

final class FruitStoreViewController: UIViewController {

    weak var delegate: FruitStoreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tabClose(_ sender: UIBarButtonItem) {
        delegate?.changeStock()
        
        dismiss(animated: true)
    }
}
