//
//  JuiceMakerViewController.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/16.
//

import UIKit

final class JuiceMakerViewController: UIViewController {
    // MARK: - Views
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    // MARK: - Properties
    private let fruitStore: FruitStore = FruitStore()
    private lazy var juiceMaker: JuiceMaker = JuiceMaker(fruitStore: self.fruitStore)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateFruitStock()
    }
    
    @IBAction func presentUpdateStockScene() {
        let updateStockViewController: UpdateStockViewController = .instantiate()
        updateStockViewController.modalPresentationStyle = .fullScreen
        updateStockViewController.modalTransitionStyle = .coverVertical
        self.present(updateStockViewController, animated: true, completion: nil)
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let juice: Juice = Juice(rawValue: sender.tag) else {
            return
        }
        
        do {
            let juice: Juice = try self.juiceMaker.makeJuice(juice)
            self.updateFruitStock()
            self.showSuccessAlert(for: juice)
        } catch JuiceMakerError.outOfStock {
            self.showFailAlert(error: .outOfStock)
        } catch {
            self.showFailAlert(error: .unknown)
        }
    }
    
    private func showSuccessAlert(for juice: Juice) {
        let alert: UIAlertController = UIAlertController(title: "제조 완료",
                                                         message: "\(juice.name) 나왔습니다! 맛있게 드세요!",
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "확인",
                                                    style: .default,
                                                    handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showFailAlert(error: JuiceMakerError) {
        let alert: UIAlertController = UIAlertController(title: "제조 실패",
                                                         message: error.localizedDescription,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "예",
                                                    style: .default) { _ in
            self.presentUpdateStockScene()
        }
        let cancleAction: UIAlertAction = UIAlertAction(title: "아니오",
                                                        style: .default,
                                                        handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancleAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Setup
extension JuiceMakerViewController {
    private func updateFruitStock() {
        self.strawberryStockLabel.text = "\(self.fruitStore.fruits[.strawberry, default: Number()])"
        self.bananaStockLabel.text = "\(self.fruitStore.fruits[.banana, default: Number()])"
        self.pineappleStockLabel.text = "\(self.fruitStore.fruits[.pineapple, default: Number()])"
        self.kiwiStockLabel.text = "\(self.fruitStore.fruits[.kiwi, default: Number()])"
        self.mangoStockLabel.text = "\(self.fruitStore.fruits[.mango, default: Number()])"
    }
}
