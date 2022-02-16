//
//  UpdateStockViewController.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

final class UpdateStockViewController: UIViewController, StoryboardBindable {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
}

// MARK: - Setup
extension UpdateStockViewController {
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationItem.title = "재고 추가"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "닫기",
                                                                 style: .done,
                                                                 target: self,
                                                                 action: #selector(back))
    }

    @objc
    private func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
