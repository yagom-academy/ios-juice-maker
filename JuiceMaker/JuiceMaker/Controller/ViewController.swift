//
//  JuiceMaker - ViewController.swift
//  Created by stone, jpush.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let fruitStore = FruitStore.shared

    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
 
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJuiceOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStockLabel()
        addNotification()
    }
    
    func setStockLabel() {
        self.strawberryStockLabel.text = "\(fruitStore.fruitsStock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(fruitStore.fruitsStock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(fruitStore.fruitsStock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(fruitStore.fruitsStock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(fruitStore.fruitsStock[.mango] ?? 0)"
    }
    
    func transitionView() {
        guard let editStockViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditStockViewController") as? EditStockViewController else { return }
        let editStockNavigationController = UINavigationController(rootViewController: editStockViewController)
        editStockViewController.stock = fruitStore.fruitsStock
        self.present(editStockNavigationController, animated: true)
    }
    
    func alertSuccess(for juice: Juice) {
        let alert = UIAlertController(title: "알림", message: "\(juice.name) 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "예", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func alertFailure(for error: Error) {
        let alert = UIAlertController(title: "알림", message: "\(error.localizedDescription)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        alert.addAction(UIAlertAction(title: "예", style: .default) { _ in self.transitionView() })
        
        self.present(alert, animated: true)
    }
    
    func addNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceivedFruitsAmountChanged(_:)),
                                               name: NSNotification.Name("fruitStockChange"),
                                               object: nil)
    }
    
    @objc func didReceivedFruitsAmountChanged(_ noti: Notification) {
        guard let userInfo = noti.userInfo?["fruitsStock"],
              let fruitsStock = userInfo as? Dictionary<Fruit,Int> else { return }
        
        self.strawberryStockLabel.text = "\(fruitsStock[.strawberry] ?? 0)"
        self.bananaStockLabel.text = "\(fruitsStock[.banana] ?? 0)"
        self.pineappleStockLabel.text = "\(fruitsStock[.pineapple] ?? 0)"
        self.kiwiStockLabel.text = "\(fruitsStock[.kiwi] ?? 0)"
        self.mangoStockLabel.text = "\(fruitsStock[.mango] ?? 0)"
    }
    
    @IBAction func editStockButtonTapped(_ sender: UIBarButtonItem) {
        transitionView()
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) {
        let juiceMaker = JuiceMaker()
    
        do {
            var juice: Juice?
            
            switch sender {
            case strawberryJuiceOrderButton:
                juice = .strawberry
            case bananaJuiceOrderButton:
                juice = .banana
            case pineappleJuiceOrderButton:
                juice = .pineapple
            case kiwiJuiceOrderButton:
                juice = .kiwi
            case mangoJuiceOrderButton:
                juice = .mango
            case strawberryBananaJuiceOrderButton:
                juice = .strawberryBanana
            case mangoKiwiJuiceOrderButton:
                juice = .mangoKiwi
            default:
                break
            }
            
            if let juice = juice {
                try juiceMaker.makeJuice(juice)
                alertSuccess(for: juice)
            }
            
        } catch {
            alertFailure(for: error)
        }
        
    }
}

