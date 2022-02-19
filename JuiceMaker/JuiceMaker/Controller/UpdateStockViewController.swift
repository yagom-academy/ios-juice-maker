//
//  UpdateStockViewController.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

final class UpdateStockViewController: UIViewController, StoryboardBindable {
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }
}

// MARK: - Setup
extension UpdateStockViewController {
    private func setupNavigationBar() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = .clear
    }

    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
}
