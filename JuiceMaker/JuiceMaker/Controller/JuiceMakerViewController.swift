//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController {
    
    @IBOutlet var labelCollection: [UILabel]! {
        didSet {
            labelCollection.sort { $0.tag < $1.tag }
        }
    }
    
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
    
    private func setupUI() {
        Fruit.allCases.enumerated().forEach { (index, fruit) in
            labelCollection[index].text = String(fruitStore.fruits[fruit] ?? .zero)
        }
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
        } catch JuiceMakerError.outOfStock {
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
        
        guard let stockChangeViewController = stockNavigationController.topViewController
                as? StockChangeViewController else {
            return
        }
        
        stockChangeViewController.delegate = self
        self.present(stockNavigationController, animated: true)
    }
}

extension JuiceMakerViewController: StockChangeViewControllerDelegate {
    func updateLabel() {
        setupUI()
    }
}
