//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/16.
//

import Foundation
import UIKit

class StockModifyViewController: UIViewController {
    // MARK: - Property
    @IBOutlet weak var stockModifyCollectionView: UICollectionView!
    
    private var store: FruitStorable?
    
    private let stockModifyCollectionViewCell = "StockModifyCollectionViewCell"
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initConfigrations()
    }
    
    // MARK: Initialization
    func initConfigrations() {
        let storeManager = FruitStockManager(stocks: [.strawberry: 10,
                                             .pineapple: 10,
                                             .mango: 10,
                                             .kiwi: 10,
                                             .banana: 10])
        self.store = FruitStore(manager: storeManager)
    }
    
    // MARK: Method
    func changeStockCount(count: Int, indexPath: IndexPath) {
        guard let stockModifyCell = stockModifyCollectionView.cellForItem(at: indexPath) as? StockModifyCollectionViewCell,
              let store = store else {
            return
        }
        let fruit = Fruit.allCases[indexPath.item]
        
        store.change(fruit, to: count)
        stockModifyCell.countLabel.text = String(store.checkCount(stock: fruit))
    }
    
    // MARK: IBAction
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
    // MARK: Data Source
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
