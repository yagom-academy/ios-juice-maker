//
//  SecondViewController.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/11.
//

import UIKit

class SecondViewController: UIViewController {
    //MARK:- Property

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK:- Method
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
