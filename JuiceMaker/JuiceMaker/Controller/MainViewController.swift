//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!

    let maker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func juiceOrder(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else { print("버튼 타이틀 에러"); return }
        guard let text = titleLabel.text, let juice = Juice(rawValue: text) else { print("쥬스 구분실패"); return }
//        print(juice)
        maker.makeJuice(juice)
    }
    
}

