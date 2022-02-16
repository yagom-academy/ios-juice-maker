//
//  JuiceKioskViewController.swift
//  JuiceMaker
//
//  Created by Yoojin Park on 2022/02/16.
//

import UIKit

class JuiceKioskViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func modifyButtonTap(_ sender: Any) {
        let vc = ModifyStocksViewController.instantiate(with: "Main")
        navigationController?.pushViewController(vc, animated: true)
    }
}
