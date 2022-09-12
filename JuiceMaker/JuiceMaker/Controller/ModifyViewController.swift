//
//  ModifyViewController - ModifyViewController.swift
//  Created by Ash, 미니.
//

import UIKit

protocol Stockable {
	func updateValues(changedStock: [Fruit: Int])
}

class ModifyViewController: UIViewController {
	static let identifier = "presentModifyViewController"
	var inventory: [Fruit: Int] = [:]
	var delegate: Stockable?
	
	@IBOutlet weak var strawberryStockLabel: UILabel!
	@IBOutlet weak var bananaStockLabel: UILabel!
	@IBOutlet weak var pineAppleStockLabel: UILabel!
	@IBOutlet weak var kiwiStockLabel: UILabel!
	@IBOutlet weak var mangoStockLabel: UILabel!
	
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineAppleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
		super.viewDidLoad()
		changeNavBackgroundColor()
		setUpLabels()
        setUpStepper()
	}
	
	func changeNavBackgroundColor() {
		navigationController?.navigationBar.backgroundColor = .systemGray5
	}
	
	@IBAction func didTapDismissButton(_ sender: UIBarButtonItem) {
		delegate?.updateValues(changedStock: inventory)
		dismiss(animated: true)
	}
	
	func setUpLabels() {
		[
			strawberryStockLabel,
			bananaStockLabel,
			pineAppleStockLabel,
			kiwiStockLabel,
			mangoStockLabel,
		].compactMap { $0 }.forEach {
            if let fruit = Fruit(rawValue: $0.tag),
               let stock = inventory[fruit]?.description {
                $0.text = stock
            }
		}
	}
    
    func setUpStepper() {
        [
            strawberryStepper,
            bananaStepper,
            pineAppleStepper,
            kiwiStepper,
            mangoStepper,
        ].compactMap { $0 }.forEach {
            if let fruit = Fruit(rawValue: $0.tag),
               let stock = inventory[fruit] {
                $0.value = Double(stock)
            }
        }
    }
    
    @IBAction func didTappedStepper(_ sender: UIStepper) {
        if let fruit = Fruit(rawValue: sender.tag) {
            inventory[fruit] = Int(sender.value)
            setUpLabels()
        }
    }
}
