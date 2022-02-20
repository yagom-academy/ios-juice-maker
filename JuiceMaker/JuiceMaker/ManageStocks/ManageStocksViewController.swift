//
//  ManageStocksViewController.swift
//  JuiceMaker
//
//  Created by Dayeon Jung on 2022/02/19.
//

import UIKit

class ManageStocksViewController: UIViewController {
    lazy var closeBarButton: UIBarButtonItem = {
        let closeButton = UIBarButtonItem(
            title: "닫기",
            style: .done,
            target: self,
            action: #selector(didTapCloseButton)
        )
        return closeButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setRightBarButton(
            closeBarButton,
            animated: false
        )
    }

    @objc
    func didTapCloseButton() {
        self.dismiss(
            animated: true,
            completion: nil
        )
    }
}
