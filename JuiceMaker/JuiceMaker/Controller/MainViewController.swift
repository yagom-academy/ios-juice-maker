//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func moveToManageView(_ sender: UIBarButtonItem) {
        guard let manageVC = self.storyboard?.instantiateViewController(withIdentifier: "ManageViewController") else { return }
        self.navigationController?.present(manageVC, animated: true, completion: nil)
    }
}

