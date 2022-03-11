//  EditFruitStockViewController.swift
//  Created by Quokka, Donnie

import UIKit

final class FruitStockEditViewController: UIViewController {
    @IBOutlet private var fruitStockLabels: [UILabel]!
    @IBOutlet private var fruitStockSteppers: [UIStepper]!
    var fruitsStock = [String]()
    weak var delegate: FruitStockDelegate?
    
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .blue
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(tapDismissButton), for: .touchUpInside)
        return button
    }()
    private let editStockTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "재고 추가"
        label.textColor = .black
        label.backgroundColor = .systemGray5
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateFruitsCountLabel()
        setConstraintUI()
        asignFruitsCountToStepperValue()
    }
    
    private func asignFruitsCountToStepperValue() {
        for index in fruitStockLabels.indices {
            guard let fruitCount = fruitStockLabels[index].text,
                  let currentCount = Double(fruitCount) else { return }
            fruitStockSteppers[index].value = currentCount
        }
    }
    
    @IBAction func fruitStockCountStepper(_ sender: UIStepper) {
        fruitStockLabels[sender.tag].text = Int(sender.value).description
    }
    
    private func updateFruitsCountLabel() {
        for index in fruitStockLabels.indices {
            fruitStockLabels[index].text = fruitsStock[index]
        }
    }
    
    private func setConstraintUI() {
        view.addSubview(editStockTitleLabel)
        editStockTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        editStockTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        editStockTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        editStockTitleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        editStockTitleLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true

        view.addSubview(dismissButton)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerYAnchor.constraint(equalTo: editStockTitleLabel.centerYAnchor).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        dismissButton.topAnchor.constraint(equalTo: editStockTitleLabel.topAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: editStockTitleLabel.heightAnchor).isActive = true
    }
    
    private func updateFruitInventory() {
        for index in fruitStockLabels.indices {
            guard let fruitStockLabel = fruitStockLabels[index].text else { return }
            fruitsStock[index] = fruitStockLabel
        }
    }
    
    @objc private func tapDismissButton() {
        updateFruitInventory()
        delegate?.sendData(fruitsStock)
        dismiss(animated: true, completion: nil)
    }
}
