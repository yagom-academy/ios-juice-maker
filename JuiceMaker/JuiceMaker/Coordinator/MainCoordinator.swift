//
//  MainCoordinator.swift
//  JuiceMaker
//
//  Created by soyounglee on 2022/02/16.
//

import UIKit

protocol MainCoordinatable: AnyObject {
  func showStockViewController(parentViewController: UIViewController)
}

class MainCoordinator: Coordinator, MainCoordinatable {
  var childCoordinators = [Coordinator]()
  var navigationController: UINavigationController
  var juiceMaker: JuiceMakable
  var fruitStore: FruitStorable
  
  init(navigationController: UINavigationController, juiceMaker: JuiceMakable, fruitStore: FruitStorable) {
    self.navigationController = navigationController
    self.juiceMaker = juiceMaker
    self.fruitStore = fruitStore
  }
  
  func start() {
    guard let orderViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OrderViewController") as? OrderViewController else { return }
    let orderViewModel = OrderViewModel(juiceMaker: juiceMaker, fruitStore: fruitStore)
    
    orderViewController.coordinator = self
    orderViewController.viewModel = orderViewModel
    navigationController.pushViewController(orderViewController, animated: false)
  }
  
  func showStockViewController(parentViewController: UIViewController) {
    guard let stockViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StockViewController") as? StockViewController else { return }
    let stockViewModel = StockViewModel(fruitStore: fruitStore)
    
    stockViewController.viewModel = stockViewModel
    parentViewController.present(stockViewController, animated: true)
  }
}
