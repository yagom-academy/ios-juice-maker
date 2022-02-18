//
//  FruitInventoryManageViewController.swift
//  JuiceMaker
//
//  Created by 김정상 on 2022/02/19.
//

import UIKit

import RxCocoa

class FruitInventoryManageViewController: UIViewController {
    
    @IBOutlet weak var closeBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let _ = closeBarButtonItem.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let `self` = self else { return }
                self.dismiss(animated: true)
            })
            
    }
    
}
