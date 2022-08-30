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
		
		for _ in 1...20 {
			maker.makeJuice(juice: juice)
		}
    }


}

