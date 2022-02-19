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
    @IBOutlet private weak var stockModifyCollectionView: UICollectionView!
    
    private var fruitStore: FruitStorable?
    
    // MARK: Method
    func receiveFruitStore(fruitStore: FruitStorable) {
        self.fruitStore = fruitStore
    }
    
    func changeStockCount(count: Int, indexPath: IndexPath) {
        guard let stockModifyCell = stockModifyCollectionView.cellForItem(at: indexPath) as? StockModifyCollectionViewCell,
              let fruitStore = fruitStore else {
            return
        }
        let fruit = Fruit.allCases[indexPath.item]
        fruitStore.change(fruit, to: count)
        
        let count = fruitStore.checkCount(stock: fruit)
//        stockModifyCell.update(count: count)
        stockModifyCollectionView.reloadData()
    }
    
    // MARK: IBAction
    @IBAction func submitButtonTouched(_ sender: Any) {
        guard let fruitStore = fruitStore else {
            return
        }
        NotificationCenter.default.post(name: NotificationNameSpace.sendFruitStoreDataNotificationName,
                                        object: self,
                                        userInfo: [NotificationNameSpace.UserInfo.fruitStore:fruitStore])
        self.navigationController?.popViewController(animated: true)
    }
}

extension StockModifyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Fruit.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewNameSpace.stockModifyCellResuableID,
                                                      for: indexPath)
        guard let stockModifyCell = cell as? StockModifyCollectionViewCell,
              let fruitStore = fruitStore else {
            return cell
        }
        stockModifyCell.update(fruitImageAssetName: Fruit.emoji(offset: indexPath.item),
                               count: fruitStore.checkCount(stock: Fruit.allCases[indexPath.item])) { [weak self] in
            self?.changeStockCount(count: stockModifyCell.fruitCount, indexPath: indexPath)
        }
        return stockModifyCell
    }
}
