//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceOrderViewController: UIViewController {
    // MARK: - Property
    // MARK: - IBOutlet
    @IBOutlet private weak var fruitStockCollectionView: UICollectionView!
    @IBOutlet private weak var orderButtonCollectionView: UICollectionView!
    
    // MARK: Model
    private var juiceMaker: JuiceMaker?
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fruitStockCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initJuiceMaker()
        addObservers()
    }
    
    // MARK: - Initialization
    private func initJuiceMaker() {
        let storeManager = FruitStockManager(stocks: StockNameSpace.initValue)
        let fruitStore = FruitStore(manager: storeManager)
        
        self.juiceMaker = JuiceMaker(store: fruitStore)
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateFruitStore),
                                               name: NotificationNameSpace.sendFruitStoreDataNotificationName,
                                               object: nil)
    }
    
    // MARK: - Method
    private func makeJuice(_ juice: Juice) {
        do {
            let _ = try juiceMaker?.make(into: juice)
            presentCompletedMakeAlert(juice: juice.name)
        } catch StoreError.outOfStock(let name) {
            presentNotCompletedMakeAlert(juice: name)
        } catch StoreError.notEnoughStock(let name, let stock) {
            presentNotCompletedMakeAlert(juice: name, count: stock)
        } catch StoreError.notExistStuff(let name) {
            assertionFailure(String(format: StoreErrorNameSpace.notExistStuff, name))
        } catch {
            assertionFailure(StoreErrorNameSpace.unknownError)
        }
    }
    
    private func presentCompletedMakeAlert(juice: String) {
        let formatedCompletedTitle = formatCompletedTitle(juice: juice)
        let submitAlertAction = UIAlertAction(title: AlertNameSpace.Action.OK, style: .default)
        
        presentAlert(title: formatedCompletedTitle, actions: [submitAlertAction])
    }
    
    private func presentNotCompletedMakeAlert(juice: String, count: Int? = nil) {
        let formatedNotCompletedTitle = formatNotCompletedTitle(juice: juice, count: count)
        let noAlertAction = UIAlertAction(title: AlertNameSpace.Action.no, style: .cancel)
        let yesAlertAction = UIAlertAction(title: AlertNameSpace.Action.yes, style: .default) { _ in
            self.presentModifyStockView()
        }
        presentAlert(title: formatedNotCompletedTitle, actions: [noAlertAction, yesAlertAction])
    }
    
    private func formatCompletedTitle(juice: String) -> String {
        return String(format: AlertNameSpace.completeMakeJuice, juice)
    }
    
    private func formatNotCompletedTitle(juice: String, count: Int? = nil) -> String {
        guard let count = count else {
            return String(format: AlertNameSpace.outOfStock, juice)
        }
        return String(format: AlertNameSpace.notEnoughStock, juice, count)
    }
    
    private func presentModifyStockView() {
        let storyboard = UIStoryboard(name: StoryboardNameSpace.mainStoryboardName, bundle: nil)
        guard let stockModifyVC = storyboard.instantiateViewController(withIdentifier: StoryboardNameSpace.stockModifyViewControllerID) as? StockModifyViewController,
              let fruitStore = juiceMaker?.store else {
            return
        }
        stockModifyVC.modalPresentationStyle = .fullScreen
        stockModifyVC.receiveFruitStore(fruitStore: fruitStore)
        
        navigationController?.pushViewController(stockModifyVC, animated: true)
    }
    
    @objc private func updateFruitStore(_ notification: Notification) {
        guard let store = notification.userInfo?[NotificationNameSpace.UserInfo.fruitStore] as? FruitStorable else {
            return
        }
        juiceMaker?.changeStore(to: store)
    }
    
    // MARK: IBAction
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
        fruitStockCollectionView.reloadData()
    }
}

// MARK: Collection view Data source
extension JuiceOrderViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case fruitStockCollectionView:
            return Fruit.allCases.count
        case orderButtonCollectionView:
            return Juice.allCases.count
        default:
            return Int.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case fruitStockCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewNameSpace.fruitStockCellResuableID, for: indexPath)
            return updateFruitStockCell(cell: cell, indexPath: indexPath)
        case orderButtonCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewNameSpace.orderButtonCellResuableID, for: indexPath)
            return updateOrderButtonCell(cell: cell, indexPath: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    private func updateFruitStockCell(cell: UICollectionViewCell, indexPath: IndexPath) -> UICollectionViewCell {
        guard let fruitStockCollectionViewCell = cell as? FruitStockCollectionViewCell,
              let juiceMaker = juiceMaker else {
            return cell
        }
        let fruit = Fruit.allCases[indexPath.item]
        let count = juiceMaker.checkCount(stock: fruit)
        
        fruitStockCollectionViewCell.update(fruitImageAssetName: fruit.imageName, count: count)
        
        return fruitStockCollectionViewCell
    }
    
    private func updateOrderButtonCell(cell: UICollectionViewCell, indexPath: IndexPath) -> UICollectionViewCell {
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
        return CGFloat(CollectionViewNameSpace.minimumLineSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(CollectionViewNameSpace.minimumInteritemSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case fruitStockCollectionView:
            return CGSize(width:
                            CollectionViewNameSpace.calcFruitStockCellReduceConstant(collectionView.frame.width),
                          height: collectionView.frame.height)
        case orderButtonCollectionView:
            let constant = CollectionViewNameSpace.calcOrderButtonCellReduceConstant(collectionView.frame.width, height: collectionView.frame.height)
            return CGSize(width: constant.width, height: constant.height)
        default:
            return CGSize.zero
        }
    }
}
