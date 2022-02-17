//
//  ModifyStocksViewController.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/16.
//

import UIKit

class ModifyStocksViewController: UIViewController {

    // MARK: - Outlet Property
    @IBOutlet weak var strawberryStepper: UIStepper!
    
    // MARK: - Property
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - func
    // MARK: - Action
    
    @IBAction func closeButtonTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
