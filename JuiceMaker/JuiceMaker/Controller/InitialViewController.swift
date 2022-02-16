//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class InitialViewController: UIViewController {
    
    var fruitStore = FruitStore(manager: FruitStockManager(stocks: [
        .strawberry:10,
        .banana:10,
        .mango:10,
        .pineapple:10,
        .kiwi:10])
    )
    
    private lazy var juiceMaker = JuiceMaker(store: fruitStore)
    
    @IBOutlet weak var fruitsStockCollectionView: UICollectionView!
    @IBOutlet weak var orderButtonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsStockCollectionView.dataSource = self
        fruitsStockCollectionView.delegate = self
        orderButtonCollectionView.dataSource = self
        orderButtonCollectionView.delegate = self
    }
    
    @IBAction func showModifyStocksVC(_ sender: UIBarButtonItem) {
        presentModifyStockView()
    }
    
    private func tryMake(_ juice: Juice) {
        var result: Bool = false
        do {
            result = try juiceMaker.make(into: juice)
        } catch {
            print("\(error.localizedDescription)")
        }
        if result == true {
            showCompleteMakeAlert(about: juice.name)
        } else {
            showFailedMakeAlert(about: juice.name)
        }
    }
    
    private func showCompleteMakeAlert(about juice: String) {
        let alert = UIAlertController(title: "\(juice)\(AlertTitle.completeMakeJuice)", message: nil, preferredStyle: .alert)
        let okayAlertAction = UIAlertAction(title: AlertTitle.action.okay, style: .default)
        alert.addAction(okayAlertAction)
        present(alert, animated: true)
    }
    
    private func showFailedMakeAlert(about juice: String) {
        let alert = UIAlertController(title: AlertTitle.faliMAkeJuice, message: nil, preferredStyle: .alert)
        let declineAlertActin = UIAlertAction(title: AlertTitle.action.no, style: .cancel)
        let okayAlertAction = UIAlertAction(title: AlertTitle.action.yes, style: .default) { _ in
            self.presentModifyStockView()
        }
        alert.addAction(declineAlertActin)
        alert.addAction(okayAlertAction)
        present(alert, animated: true)
    }
    
    private func presentModifyStockView() {
        let storyboard = UIStoryboard(name: StoryboadName.main, bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: StoryboardID.stockModifyViewController)
        destinationVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}

//MARK: Collection view
extension InitialViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case fruitsStockCollectionView:
            return Fruit.allCases.count
        case orderButtonCollectionView:
            return Juice.allCases.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case fruitsStockCollectionView:
            guard let fruitStockCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitStockCollectionViewCell.reuseIdentifier, for: indexPath) as? FruitStockCollectionViewCell else {
                return UICollectionViewCell()
            }
            let fruit = Fruit.allCases[indexPath.item]
            fruitStockCollectionViewCell.fruitEmojiLabel.text = fruit.emoji
            fruitStockCollectionViewCell.fruitStockLabel.text = "\(fruitStore.checkCount(stock: fruit))"
            return fruitStockCollectionViewCell
        case orderButtonCollectionView:
            guard let orderButtonCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderButtonCollectionViewCell.reuseIdentifier, for: indexPath) as? OrderButtonCollectionViewCell else {
                return UICollectionViewCell()
            }
            orderButtonCollectionViewCell.juiceLabel.text = "\(Juice.allCases[indexPath.item].name) 쥬스"
            return orderButtonCollectionViewCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case fruitsStockCollectionView:
            let size = CGSize(width: (collectionView.frame.width-10)/5, height: collectionView.frame.height)
            return size
        case orderButtonCollectionView:
            let size = CGSize(width: (collectionView.frame.width-20)/2, height: collectionView.frame.height/3)
            return size
        default:
            return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard collectionView == orderButtonCollectionView else {
            return
        }
        tryMake(Juice.allCases[indexPath.item])
        let ingredients = Juice.allCases[indexPath.item].ingredients
        var usedFruit = [IndexPath]()
        for ingredient in ingredients {
            let index = IndexPath(item: Fruit.allCases.firstIndex(of: ingredient.name)!, section: 0)
            usedFruit.append(index)
        }
        fruitsStockCollectionView.reloadItems(at: usedFruit)
    }
}
