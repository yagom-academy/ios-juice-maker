//
//  EditFruitStockViewController.swift
//  JuiceMaker
//
//  Created by SeoDongyeon on 2022/02/25.
//

import UIKit

class EditFruitStockViewController: UIViewController {
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닫기", for: .normal)
        button.tintColor = .systemRed
        button.titleLabel?.font = UIFont(name: "Body", size: 40)
        button.addTarget(self, action: #selector(tapCloseButton), for: .touchUpInside)
        return button
    }()

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!

    var strawberryCount: String = ""
    var bananaCount: String = ""
    var pineappleCount: String = ""
    var kiwiCount: String = ""
    var mangoCount: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraintCloseButton()
        asignFruitCountValue()
    }
    
    private func setConstraintCloseButton() {
        view.addSubview(closeButton)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func asignFruitCountValue() {
        strawberryStockLabel.text = strawberryCount
        bananaStockLabel.text = bananaCount
        pineappleStockLabel.text = pineappleCount
        kiwiStockLabel.text = kiwiCount
        mangoStockLabel.text = mangoCount
    }
    
    @objc private func tapCloseButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
