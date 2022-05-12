//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {
    var juiceMaker = JuiceMaker()
    
    @IBOutlet private var fruitLabels: [UILabel]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStock()
    }
    
    @IBAction private func orderFruitJuice(_ sender: UIButton) {
        if let juice = Juice(rawValue: sender.tag) {
            make(to: juice)
        }
    }
    
    private func updateStock() {
        for fruitIndex in 0..<fruitLabels.count {
            guard let fruit = Fruit(rawValue: fruitIndex),
                  let fruitStock = juiceMaker.fruitStore.stocks[fruit] else {
                return
            }
            fruitLabels[fruitIndex].text = fruitStock.description
        }
    }
    
    private func make(to juice: Juice) {
        do {
            try juiceMaker.makeJuice(of: juice)
            alertSuccessMakeJuice(to: juice)
            updateStock()
        } catch {
            guard let error = error as? StockError else {
                return
            }
            switch error {
            case .outOfStock:
                alertFailMakeJuice()
                juiceMaker.fruitStore.insufficientStock.removeAll()
            case .unknown:
                alertUnknownError()
            }
        }
    }
    
    private func alertUnknownError() {
        let unknownErrorAlert = UIAlertController(title: "unknownError",
                                                  message: "알 수 없는 에러가 발생하였습니다.",
                                                  preferredStyle: .alert)
        
        unknownErrorAlert.addAction(UIAlertAction(title: "확인",
                                                  style: .default,
                                                  handler: nil))
        
        self.present(unknownErrorAlert, animated: false)
    }
    
    private func alertSuccessMakeJuice(to juice: Juice) {
        let successAlert = UIAlertController(title: "성공!",
                                             message: "\(juice.name)쥬스 나왔습니다! 맛있게 드세요!",
                                             preferredStyle: .alert)
        
        successAlert.addAction(UIAlertAction(title: "확인",
                                             style: .default,
                                             handler: nil))
        
        self.present(successAlert, animated: false)
    }
    
    private func alertFailMakeJuice() {
        let failAlert = UIAlertController(title: "실패",
                                          message: "재료가 모자라요. 재고를 수정할까요?",
                                          preferredStyle: .alert)
        
        failAlert.addAction(UIAlertAction(title: "예",
                                          style: .default,
                                          handler: {_ in self.performSegue(withIdentifier: "moveToFruitStock", sender: nil)}))
        
        failAlert.addAction(UIAlertAction(title: "아니요",
                                          style: .cancel,
                                          handler: nil))
        
        self.present(failAlert, animated: false)
    }
}
