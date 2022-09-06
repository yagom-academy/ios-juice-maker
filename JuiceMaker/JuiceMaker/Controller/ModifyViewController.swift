//
//  ModifyViewController - ModifyViewController.swift
//  Created by Ash, 미니.
//

import UIKit

class ModifyViewController: UIViewController {
	static let identifier = "presentModify"
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func didTapDismissButton(_ sender: UIBarButtonItem) {
		dismiss(animated: true)
	}
}

