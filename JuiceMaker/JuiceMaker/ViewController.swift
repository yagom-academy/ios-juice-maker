//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    enum YagomJuice: Juice {
        case strawbana, mangki, strawberry, banana, pineapple, kiwi, mango
        
        var description: String {
            switch self {
            case .strawbana: return "딸바쥬스"
            case .mangki: return "망키쥬스"
            case .strawberry: return "딸기쥬스"
            case .banana: return "바나나쥬스"
            case .pineapple: return "파인애플쥬스"
            case .kiwi: return "키위쥬스"
            case .mango: return "망고쥬스"
            }
        }
        
        var ingredients: [Fruit: Int] {
            switch self {
            case .strawbana: return [.strawberry: 10, .banana: 1]
            case .mangki: return [.mango: 2, .kiwi: 1]
            case .strawberry: return [.strawberry: 16]
            case .banana: return [.banana: 2]
            case .pineapple: return [.pineapple: 2]
            case .kiwi: return [.kiwi: 3]
            case .mango: return [.mango: 3]
            }
        }
    }
    
    private var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawbanaOrderButton: UIButton!
    @IBOutlet weak var mangkiOrderButton: UIButton!
    @IBOutlet weak var strawberryOrderButton: UIButton!
    @IBOutlet weak var bananaOrderButton: UIButton!
    @IBOutlet weak var pineappleOrderButton: UIButton!
    @IBOutlet weak var kiwiOrderButton: UIButton!
    @IBOutlet weak var mangoOrderButton: UIButton!
    @IBAction func strawbanaOrderCameIn(_ sender: UIButton) {
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.make(juice: YagomJuice.strawbana)
        updateViewWithCurrentStock()
    }
    @IBAction func mangkiOrderCameIn(_ sender: UIButton) {
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.make(juice: YagomJuice.mangki)
        updateViewWithCurrentStock()
    }
    @IBAction func strawberryOrderCameIn(_ sender: UIButton) {
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.make(juice: YagomJuice.strawberry)
        updateViewWithCurrentStock()
    }
    @IBAction func bananaOrderCameIn(_ sender: UIButton) {
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.make(juice: YagomJuice.banana)
        updateViewWithCurrentStock()
    }
    @IBAction func pineappleOrderCameIn(_ sender: UIButton) {
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.make(juice: YagomJuice.pineapple)
        updateViewWithCurrentStock()
    }
    @IBAction func kiwiOrderCameIn(_ sender: UIButton) {
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.make(juice: YagomJuice.kiwi)
        updateViewWithCurrentStock()
    }
    @IBAction func mangoOrderCameIn(_ sender: UIButton) {
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.make(juice: YagomJuice.mango)
        updateViewWithCurrentStock()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.juiceMaker = JuiceMaker(stockCount: 20)
        guard let juiceMaker = juiceMaker else { return }
        juiceMaker.delegate = self
        updateViewWithCurrentStock()
        buttonInitialSetting()
    }
    
    private func updateViewWithCurrentStock() {
        guard let juiceMaker = juiceMaker else { return }
        strawberryStockLabel.text = "\(juiceMaker.stock(of: .strawberry) ?? 0)"
        bananaStockLabel.text = "\(juiceMaker.stock(of: .banana) ?? 0)"
        pineappleStockLabel.text = "\(juiceMaker.stock(of: .pineapple) ?? 0)"
        kiwiStockLabel.text = "\(juiceMaker.stock(of: .kiwi) ?? 0)"
        mangoStockLabel.text = "\(juiceMaker.stock(of: .mango) ?? 0)"
    }
    
    private func buttonInitialSetting() {
        strawbanaOrderButton.titleLabel?.textAlignment = .center
        mangkiOrderButton.titleLabel?.textAlignment = .center
        strawberryOrderButton.titleLabel?.textAlignment = .center
        bananaOrderButton.titleLabel?.textAlignment = .center
        pineappleOrderButton.titleLabel?.textAlignment = .center
        kiwiOrderButton.titleLabel?.textAlignment = .center
        mangoOrderButton.titleLabel?.textAlignment = .center
        
        strawbanaOrderButton.layer.borderWidth = 0.5
        mangkiOrderButton.layer.borderWidth = 0.5
        strawberryOrderButton.layer.borderWidth = 0.5
        bananaOrderButton.layer.borderWidth = 0.5
        pineappleOrderButton.layer.borderWidth = 0.5
        kiwiOrderButton.layer.borderWidth = 0.5
        mangoOrderButton.layer.borderWidth = 0.5
    }
}

extension ViewController: ResultProcessDelegate {
    func alert(_ message: String) {
        let alert = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
            
        self.present(alert, animated: true)
    }
    
    func alertWithCancel(_ message: String) {
        let alert = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "예", style: .default) { _ in
            let stockEditViewController = UIStoryboard(
                name: "Main",
                bundle: nil
            ).instantiateViewController(identifier: "StockEditViewController")
            
            self.present(stockEditViewController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
            
        self.present(alert, animated: true)
    }
}

