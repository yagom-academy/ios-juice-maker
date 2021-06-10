//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpModifyStock(_ sender: UIBarButtonItem) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "storage")
        self.navigationController?.pushViewController(pushVC!, animated: true)
    }
    
}

