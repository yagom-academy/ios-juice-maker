//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/16.
//

import Foundation
import UIKit

class StockModifyViewController: UIViewController {
    @IBOutlet weak var stockModifyCollectionView: UICollectionView!
    
    private var store: FruitStorable?
    
    private let stockModifyCollectionViewCell = "StockModifyCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initObservers()
        initConfigrations()
    }
    
    func initObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeStore),
                                               name: .sendFruitStoreData,
                                               object: nil)
    }
    
    func initConfigrations() {
        let storeManager = FruitStockManager(stocks: [.strawberry: 10,
                                             .pineapple: 10,
                                             .mango: 10,
                                             .kiwi: 10,
                                             .banana: 10])
        self.store = FruitStore(manager: storeManager)
    }
    
    func changeStockCount(count: Int, indexPath: IndexPath) {
        guard let stockModifyCell = stockModifyCollectionView.cellForItem(at: indexPath) as? StockModifyCollectionViewCell,
              let store = store else {
            return
        }
        let fruit = Fruit.allCases[indexPath.item]
        
        store.change(fruit, to: count)
        stockModifyCell.countLabel.text = String(store.checkCount(stock: fruit))
    }
    
    @objc func changeStore(_ notification: Notification) {
        guard let store = notification.userInfo?["fruitStore"] as? FruitStorable else {
            return
        }
        self.store = store
    }
    
    @IBAction func confirmButtonTouched(_ sender: Any) {
        self.dismiss(animated: true)
        guard let store = store else {
            return
        }
        NotificationCenter.default.post(name: .sendFruitStoreData,
                                        object: self,
                                        userInfo: ["fruitStore":store])
    }
}

extension StockModifyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Fruit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: stockModifyCollectionViewCell,
                                                      for: indexPath)
        guard let stockModifyCell = cell as? StockModifyCollectionViewCell,
              let store = store else {
            return cell
        }
        stockModifyCell.update(emoji: Fruit.emoji(offset: indexPath.item),
                               count: store.checkCount(stock: Fruit.allCases[indexPath.item])) {
            self.changeStockCount(count: stockModifyCell.value, indexPath: indexPath)
        }
        return stockModifyCell
    }
}
