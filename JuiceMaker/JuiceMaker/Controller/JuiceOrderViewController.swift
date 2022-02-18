//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    // MARK: - Property
    // MARK: - IBOutlet
    @IBOutlet private weak var fruitsStockCollectionView: UICollectionView!
    @IBOutlet private weak var orderButtonCollectionView: UICollectionView!
    
    // MARK: Model
    private var fruitStore: FruitStorable?
    private var juiceMaker: JuiceMaker?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initJuiceMaker()
        initCollectionView()
        observeFruitStoreData()
    }
    
    // MARK: - Initialization
    func initJuiceMaker() {
        let storeManager = FruitStockManager(stocks: Stock.initValue)
        let fruitStore = FruitStore(manager: storeManager)
        
        self.fruitStore = fruitStore
        self.juiceMaker = JuiceMaker(store: fruitStore)
    }
    
    func initCollectionView() {
        fruitsStockCollectionView.delegate = self
        fruitsStockCollectionView.dataSource = self
        orderButtonCollectionView.delegate = self
        orderButtonCollectionView.dataSource = self
    }
    
    // MARK: - Method
    private func makeJuice(_ juice: Juice) {
        do {
            let _ = try juiceMaker?.make(into: juice)
            showCompletedMakeAlert(about: juice.name)
        } catch StoreError.outOfStock(let name) {
            showNotCompletedMakeAlert(about: name)
        } catch StoreError.notEnoughStock(let name, let stock) {
            showNotCompletedMakeAlert(about: name, count: stock)
        } catch StoreError.notExistStuff(let name) {
            assertionFailure(String(format: StoreErrorDescription.notExistStuff, name))
        } catch {
            assertionFailure(StoreErrorDescription.unknownError)
        }
    }
    
    private func showCompletedMakeAlert(about juice: String) {
        let alert = UIAlertController.makeSuceesJuiceAlert(juice: juice)
        present(alert, animated: true)
    }
    
    private func showNotCompletedMakeAlert(about juice: String, count: Int? = nil) {
        let alert = UIAlertController.makeFailJuiceAlert(juice: juice,
                                                         count: count) { _ in
            self.presentModifyStockView()
        }
        present(alert, animated: true)
    }
    
    private func presentModifyStockView() {
        let storyboard = UIStoryboard(name: StoryboardName.main, bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: StoryboardID.stockModifyViewController)
        destinationVC.modalPresentationStyle = .fullScreen
        //TODO: Step3 - destinationVC에서 fruitStore를 받을 메소드 추가
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    //MARK: IBAction
    @IBAction private func showModifyStockVC(_ sender: UIBarButtonItem) {
        presentModifyStockView()
    }
}

// MARK: - Collection view
// MARK: - Collection view delegate
extension JuiceOrderViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == orderButtonCollectionView else {
            return
        }
        makeJuice(Juice.allCases[indexPath.item])
        fruitsStockCollectionView.reloadData()
    }
}

// MARK: Collection view Data source
extension JuiceOrderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case fruitsStockCollectionView:
            return Fruit.allCases.count
        case orderButtonCollectionView:
            return Juice.allCases.count
        default:
            return Int.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case fruitsStockCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewID.fruitStockCell, for: indexPath)
            return updateFruitStockCell(cell: cell, indexPath: indexPath)
        case orderButtonCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewID.orderButtonCell, for: indexPath)
            return updateOrderButtonCell(cell: cell, indexPath: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    func updateFruitStockCell(cell: UICollectionViewCell, indexPath: IndexPath) -> UICollectionViewCell {
        guard let fruitStockCollectionViewCell = cell as? FruitStockCollectionViewCell,
              let juiceMaker = juiceMaker else {
            return cell
        }
        let fruit = Fruit.allCases[indexPath.item]
        
        fruitStockCollectionViewCell.update(emoji: fruit.emoji, stockCount: juiceMaker.checkCount(stock: fruit))
        
        return fruitStockCollectionViewCell
    }
    
    func updateOrderButtonCell(cell: UICollectionViewCell, indexPath: IndexPath) -> UICollectionViewCell {
        guard let orderButtonCollectionViewCell = cell as? OrderButtonCollectionViewCell else {
            return cell
        }
        orderButtonCollectionViewCell.update(name: Juice.allCases[indexPath.item].name)
        
        return orderButtonCollectionViewCell
    }
}

// MARK: Collection view delegate flow layout
extension JuiceOrderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(InitialCollectionViewLayoutConstant.minimumLineSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(InitialCollectionViewLayoutConstant.minimumInteritemSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case fruitsStockCollectionView:
            return CGSize(width:
                            InitialCollectionViewLayoutConstant.calcFruitStockCellReduceConstant(collectionView.frame.width),
                          height: collectionView.frame.height)
        case orderButtonCollectionView:
            let constant = InitialCollectionViewLayoutConstant.calcOrderButtonCellReduceConstant(collectionView.frame.width, height: collectionView.frame.height)
            return CGSize(width: constant.width, height: constant.height)
        default:
            return CGSize.zero
        }
    }
}

// MARK: - Notification center
extension JuiceOrderViewController {
    private func observeFruitStoreData() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateFruitStore),
                                               name: .sendFruitStoreData,
                                               object: nil)
    }
    
    @objc private func updateFruitStore(_ notification: Notification) {
        guard let store = notification.userInfo?[NotificationUserInfo.fruitStore] as? FruitStorable else {
            return
        }
        fruitStore = store
    }
}
