//
//  ModifyStockViewController.swift
//  JuiceMaker
//
//  Created by parkhyo on 2022/09/02.
//

import UIKit

class ModifyStockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func setNavigationBar() {
        self.title = ConstantSentence.modifyStockTitle
        self.navigationController?.navigationBar.backgroundColor = .lightGray
    }
    
}
