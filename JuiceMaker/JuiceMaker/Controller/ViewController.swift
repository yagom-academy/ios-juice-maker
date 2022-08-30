//
//  JuiceMaker - ViewController.swift
//  Created by Wonbi, woong
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let juiceMaker = JuiceMaker()
        juiceMaker.makeJuice(.kiwiJuice)
        juiceMaker.makeJuice(.kiwiJuice)
        juiceMaker.makeJuice(.kiwiJuice)
        juiceMaker.makeJuice(.kiwiJuice)
    }

    

}

