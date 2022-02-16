//
//  StockViewModel.swift
//  JuiceMaker
//
//  Created by soyounglee on 2022/02/16.
//

import Foundation
import RxSwift

protocol StockViewModelType {
  var strawberryStockObserbable: Observable<Int> { get }
  var bananaStockObserbable: Observable<Int> { get }
  var pineappleStockObserbable: Observable<Int> { get }
  var kiwiStockObserbable: Observable<Int> { get }
  var mangoStockObserbable: Observable<Int> { get }
  func increaseStock(fruit: Fruit)
  func decreaseStock(fruit: Fruit)
}

class StockViewModel: StockViewModelType {
  var fruitStore: FruitStorable
  
  let strawberryStockSubject = BehaviorSubject<Int>(value: 0)
  let bananaStockSubject = BehaviorSubject<Int>(value: 0)
  let pineappleStockSubject = BehaviorSubject<Int>(value: 0)
  let kiwiStockSubject = BehaviorSubject<Int>(value: 0)
  let mangoStockSubject = BehaviorSubject<Int>(value: 0)
  
  // output
  var strawberryStockObserbable: Observable<Int> { strawberryStockSubject }
  var bananaStockObserbable: Observable<Int> { bananaStockSubject }
  var pineappleStockObserbable: Observable<Int> { pineappleStockSubject }
  var kiwiStockObserbable: Observable<Int> { kiwiStockSubject }
  var mangoStockObserbable: Observable<Int> { mangoStockSubject }
  
  init(fruitStore: FruitStorable) {
    self.fruitStore = fruitStore
    
    initFruitStock()
  }
  
  private func initFruitStock() {
    guard let strawberryStock = fruitStore.stock(of: .strawberry),
          let bananaStock = fruitStore.stock(of: .banana),
          let pineappleStock = fruitStore.stock(of: .pineapple),
          let kiwiStock = fruitStore.stock(of: .kiwi),
          let mangoStock = fruitStore.stock(of: .mango) else { return }
    
    strawberryStockSubject.onNext(strawberryStock.quantity)
    bananaStockSubject.onNext(bananaStock.quantity)
    pineappleStockSubject.onNext(pineappleStock.quantity)
    kiwiStockSubject.onNext(kiwiStock.quantity)
    mangoStockSubject.onNext(mangoStock.quantity)
  }
  
  func increaseStock(fruit: Fruit) {
    guard let stock = fruitStore.stock(of: fruit) else { return }
    
    updateStock(fruit: fruit, quantity: stock.quantity + 1)
  }
  
  func decreaseStock(fruit: Fruit) {
    guard let stock = fruitStore.stock(of: fruit),
          stock.quantity - 1 >= 0 else { return }
    
    updateStock(fruit: fruit, quantity: stock.quantity - 1)
  }
  
  private func updateStock(fruit: Fruit, quantity: Int) {
    fruitStore.updateStock(of: fruit, quantity: quantity)
    switch fruit {
    case .strawberry:
      strawberryStockSubject.onNext(quantity)
    case .banana:
      bananaStockSubject.onNext(quantity)
    case .pineapple:
      pineappleStockSubject.onNext(quantity)
    case .kiwi:
      kiwiStockSubject.onNext(quantity)
    case .mango:
      mangoStockSubject.onNext(quantity)
    }
    
  }
}
