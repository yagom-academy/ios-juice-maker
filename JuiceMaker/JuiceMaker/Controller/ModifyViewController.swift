//
//  ModifyViewController - ModifyViewController.swift
//  Created by Ash, 미니.
//

import UIKit

protocol ModifyStockDelegate: AnyObject {
    var inventory: [Fruit: Int] { get }
	func updateStock(by fruit: Fruit, to stock: Int)
}

class ModifyViewController: UIViewController {
	static let identifier = "presentModifyViewController"
    weak var delegate: ModifyStockDelegate?
    
    @IBOutlet var fruitLabels: [UILabel]!
    @IBOutlet var stockSteppers: [UIStepper]!
    
    override func viewDidLoad() {
		super.viewDidLoad()
		changeNavBackgroundColor()
		setUpLabels()
        setUpStepper()
	}
}

// UI 관련 메서드
private extension ModifyViewController {
    func changeNavBackgroundColor() {
        navigationController?.navigationBar.backgroundColor = .systemGray5
    }
    
    func setUpLabels() {
        fruitLabels.compactMap { $0 }.forEach {
            if let fruit = Fruit(rawValue: $0.tag),
               let stock = delegate?.inventory[fruit]?.description {
                $0.text = stock
            }
        }
    }
    
    func setUpStepper() {
        stockSteppers.compactMap { $0 }.forEach {
            if let fruit = Fruit(rawValue: $0.tag),
               let stock = delegate?.inventory[fruit] {
                $0.value = Double(stock)
            }
        }
    }
}

// 버튼 관련 메서드
private extension ModifyViewController {
    @IBAction func didTappedStepper(_ sender: UIStepper) {
        if let fruit = Fruit(rawValue: sender.tag) {
            delegate?.updateStock(by: fruit, to: Int(sender.value))
            setUpLabels()
        }
    }
}

// 화면 이동 관련 메서드
private extension ModifyViewController {
    @IBAction func didTapDismissButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
