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
        
        initConfigrations()
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
        store?.change(Fruit.allCases[indexPath.item], to: count)
        stockModifyCollectionView.reloadData()
    }
    
    @IBAction func confirmButtonTouched(_ sender: Any) {
        self.dismiss(animated: true)
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
