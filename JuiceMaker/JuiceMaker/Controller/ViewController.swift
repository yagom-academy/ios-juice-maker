//
//  JuiceMaker - ViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let juice: Juice = Juice.mangokiwiJuice
        let maker = JuiceMaker()
        maker.makeJuice(juice: juice)
    }


}

