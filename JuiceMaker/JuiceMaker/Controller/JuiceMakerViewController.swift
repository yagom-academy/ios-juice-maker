//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    private let juiceMaker: JuiceMaker = JuiceMaker()
    private let fruitStore: FruitStore = FruitStore.shared
    
    private enum Message {
        static let yes: String = "예"
        static let no: String = "아니오"
        static let check: String = "확인"
        static let success: String = " 나왔습니다! 맛있게 드세요!"
        static let outOfStock: String = "재료가 모자라요. 재고를 수정할까요?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    private func setupUI() {
        strawberryStockLabel.text = String(fruitStore.fruits[.strawberry] ?? .zero)
        bananaStockLabel.text = String(fruitStore.fruits[.banana] ?? .zero)
        pineappleStockLabel.text = String(fruitStore.fruits[.pineapple] ?? .zero)
        kiwiStockLabel.text = String(fruitStore.fruits[.kiwi] ?? .zero)
        mangoStockLabel.text = String(fruitStore.fruits[.mango] ?? .zero)
    }
    
    @IBAction func stockChangeButtonTapped(_ sender: Any) {
        pushToStockViewController()
    }
    
    @IBAction func juiceOrderButtonTapped(_ sender: UIButton) {
        var menu: JuiceMenu?
        
        switch sender.tag {
        case 0:
            menu = .strawberryBananaJuice
        case 1:
            menu = .strawberryJuice
        case 2:
            menu = .bananaJuice
        case 3:
            menu = .pineappleJuice
        case 4:
            menu = .mangoKiwiJuice
        case 5:
            menu = .kiwiJuice
        case 6:
            menu = .mangoJuice
        default:
            break
        }
        
        makeJuice(of: menu)
    }
    
    private func makeJuice(of menu: JuiceMenu?) {
        guard let menu = menu else { return }
        
        do {
            try juiceMaker.makeJuice(menu: menu)
            setupUI()
            alertJuiceMakeSucess(of: menu)
        } catch StockError.outOfStock {
            alertOutOfStock()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func alertJuiceMakeSucess(of menu: JuiceMenu) {
        let message: String = menu.rawValue + Message.success
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let check = UIAlertAction(title: Message.check, style: .default)
        
        alert.addAction(check)
        self.present(alert, animated: true)
    }
    
    private func alertOutOfStock() {
        let alert = UIAlertController(title: nil, message: Message.outOfStock, preferredStyle: .alert)
        let yes = UIAlertAction(title: Message.yes, style: .destructive) { _ in
            self.pushToStockViewController()
        }
        let no = UIAlertAction(title: Message.no, style: .default)
        
        alert.addAction(yes)
        alert.addAction(no)
        self.present(alert, animated: true)
    }
    
    private func pushToStockViewController() {
        guard let stockNavigationController = self.storyboard?.instantiateViewController(
            withIdentifier: "StockChangeNavigationController"
        ) as? UINavigationController else {
            return
        }
        
        stockNavigationController.modalPresentationStyle = .fullScreen
        self.present(stockNavigationController, animated: true)
    }
}
