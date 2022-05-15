//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceOrderViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet private weak var strawberryInventoryLabel: UILabel!
    @IBOutlet private weak var bananaInventoryLabel: UILabel!
    @IBOutlet private weak var pineappleInventoryLabel: UILabel!
    @IBOutlet private weak var kiwiInventoryLabel: UILabel!
    @IBOutlet private weak var mangoInventoryLabel: UILabel!
    
    @IBOutlet private weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet private weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet private weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet private weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet private weak var mangoJuiceOrderButton: UIButton!
    
    private lazy var juiceMenuForEachButton = [
        strawberryBananaJuiceOrderButton: JuiceMaker.Menu.strawberryBananaJuice,
        mangoKiwiJuiceOrderButton: JuiceMaker.Menu.mangoKiwiJuice,
        strawberryJuiceOrderButton: JuiceMaker.Menu.strawberryJuice,
        bananaJuiceOrderButton: JuiceMaker.Menu.bananaJuice,
        pineappleJuiceOrderButton: JuiceMaker.Menu.pineappleJuice,
        kiwiJuiceOrderButton: JuiceMaker.Menu.kiwiJuice,
        mangoJuiceOrderButton: JuiceMaker.Menu.mangoJuice
    ]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateFruitsInventoryLabels()
    }
}

// MARK: - UI

extension JuiceOrderViewController {
    private func updateFruitsInventoryLabels() {
        let errorValue = -1
        strawberryInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.strawberry] ?? errorValue)
        bananaInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.banana] ?? errorValue)
        pineappleInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.pineapple] ?? errorValue)
        kiwiInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.kiwi] ?? errorValue)
        mangoInventoryLabel.text = String(JuiceMaker.shared.store.fruitsInventory[.mango] ?? errorValue)
    }
    
    private func showSuccessAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "고마워요 😘", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    private func showFailureAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default) { [weak self] _ in
            guard let storyboard = self?.storyboard?.instantiateViewController(identifier: "InventoryViewController") else {
                return
            }
            
            storyboard.modalPresentationStyle = .fullScreen
            self?.present(storyboard, animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Action

extension JuiceOrderViewController {
    @IBAction private func tapJuiceOrderButton(_ sender: UIButton) {
        guard let juice = juiceMenuForEachButton[sender] else {
            return
        }
        
        order(juice)
    }
    
    private func order(_ juice: JuiceMaker.Menu) {
        do {
            try JuiceMaker.shared.make(juice: juice)
            showSuccessAlert(message: "\(juice.rawValue) 나왔습니다! 맛있게 드세요!")
            updateFruitsInventoryLabels()
        } catch {
            showFailureAlert(message: "재료가 모자라요. 재고를 수정할까요?")
        }
    }
}
