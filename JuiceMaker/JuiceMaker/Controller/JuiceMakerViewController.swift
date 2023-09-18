//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    private let juiceMaker: JuiceMaker = JuiceMaker()
    private let fruitStore: FruitStore = FruitStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        strawberryStockLabel.text = String(fruitStore.fruits[.strawberry] ?? 0)
        bananaStockLabel.text = String(fruitStore.fruits[.banana] ?? 0)
        pineappleStockLabel.text = String(fruitStore.fruits[.pineapple] ?? 0)
        kiwiStockLabel.text = String(fruitStore.fruits[.kiwi] ?? 0)
        mangoStockLabel.text = String(fruitStore.fruits[.mango] ?? 0)
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
        } catch Errors.outOfStock {
            alertOutOfStock()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func alertJuiceMakeSucess(of menu: JuiceMenu) {
        let message: String = "\(menu.rawValue) 나왔습니다! 맛있게 드세요!"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let check = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(check)
        present(alert, animated: true)
    }
    
    private func alertOutOfStock() {
        let alert = UIAlertController(title: nil, message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "예", style: .destructive) { _ in
            self.pushToStockViewController()
        }
        let no = UIAlertAction(title: "아니오", style: .default)
        
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true)
    }
    
    private func pushToStockViewController() {
        guard let stockViewController = self.storyboard?.instantiateViewController(withIdentifier: "StockChangeViewController") as? StockChangeViewController else { return }
        
        self.navigationController?.pushViewController(stockViewController, animated: true)
    }
}
