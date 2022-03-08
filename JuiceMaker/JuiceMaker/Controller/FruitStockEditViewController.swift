//  EditFruitStockViewController.swift
//  Created by Quokka, Donnie

import UIKit

final class FruitStockEditViewController: UIViewController {
    private let dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .blue
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
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
        setConstraintUI()
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
        dismissButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: view.safeAreaInsets.right).isActive = true
        dismissButton.topAnchor.constraint(equalTo: editStockTitleLabel.topAnchor).isActive = true
        dismissButton.heightAnchor.constraint(equalTo: editStockTitleLabel.heightAnchor).isActive = true
    }
}
