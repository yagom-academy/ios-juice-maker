//
//  ModifyViewController - ModifyViewController.swift
//  Created by Ash, 미니.
//

import UIKit

class ModifyViewController: UIViewController {
	static let identifier = "presentModifyViewController"
	
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNavBackgroundColor()
    }
    
    func changeNavBackgroundColor() {
        navigationController?.navigationBar.backgroundColor = .systemGray5
    }
	
	@IBAction func didTapDismissButton(_ sender: UIBarButtonItem) {
		dismiss(animated: true)
	}
}
