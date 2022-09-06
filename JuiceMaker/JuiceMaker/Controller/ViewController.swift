//
//  JuiceMaker - ViewController.swift
//  Created by Ash, 미니.
// 

import UIKit

class ViewController: UIViewController {
	private let maker = JuiceMaker()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func didTapJuiceButton(_ sender: UIButton) {
		guard let orderedJuice = Juice(rawValue: sender.tag) else {
			return
		}
		maker.makeJuice(juice: orderedJuice)
	}
}
