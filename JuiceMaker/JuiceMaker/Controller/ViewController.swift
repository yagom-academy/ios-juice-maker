//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, kobe
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var strawberryBananaJuice: UIButton!
    @IBOutlet weak var mangoKiwiJuice: UIButton!
    @IBOutlet weak var strawberryJuice: UIButton!
    @IBOutlet weak var bananaJuice: UIButton!
    @IBOutlet weak var pineappleJuice: UIButton!
    @IBOutlet weak var kiwiJuice: UIButton!
    @IBOutlet weak var mangoJuice: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strawberryBananaJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        mangoKiwiJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        strawberryJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        bananaJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        pineappleJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        kiwiJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
        mangoJuice.addTarget(self, action: #selector(orderJuice), for: .touchUpInside)
    }
    
    @objc func orderJuice() {
        let alert = UIAlertController(title: "재료가 모자라요.", message: "재고를 수정할까요?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "예", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "아니오", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}

