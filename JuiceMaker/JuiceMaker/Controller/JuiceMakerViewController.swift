//
//  JuiceMakerViewController.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

final class JuiceMakerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func presentUpdateStockScene(_ sender: UIBarButtonItem) {
        let updateStockViewController: UpdateStockViewController = .instantiate()
        updateStockViewController.modalPresentationStyle = .fullScreen
        updateStockViewController.modalTransitionStyle = .coverVertical
        self.present(updateStockViewController, animated: true, completion: nil)
    }
}
