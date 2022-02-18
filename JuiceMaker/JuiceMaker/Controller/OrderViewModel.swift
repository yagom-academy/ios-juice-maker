//
//  OrderViewModel.swift
//  JuiceMaker
//
//  Created by jaeyoung Yun on 2022/02/16.
//

import UIKit
import RxSwift

protocol OrderViewModelType {
  var juiceObservable: Observable<Result<Juice, JuiceMakerError>> { get }
  var strawberryStockObservable: Observable<String> { get }
  var bananaStockObservable: Observable<String> { get }
  var pineappleStockObservable: Observable<String> { get }
  var kiwiStockObservable: Observable<String> { get }
  var mangoStockObservable: Observable<String> { get }
  
  func order(juice: Juice)
  func loadFruitStock()
}

class OrderViewModel: OrderViewModelType {
  
  let juiceMaker: JuiceMakable
  let fruitStore: FruitStorable
  
  let juiceSubject = PublishSubject<Result<Juice, JuiceMakerError>>()
  var strawberryStockSubject = BehaviorSubject<String>(value: String(0))
  var bananaStockSubject = BehaviorSubject<String>(value: String(0))
  var pineappleStockSubject = BehaviorSubject<String>(value: String(0))
  var kiwiStockSubject = BehaviorSubject<String>(value: String(0))
  var mangoStockSubject = BehaviorSubject<String>(value: String(0))
  
  // output
  
  var juiceObservable: Observable<Result<Juice, JuiceMakerError>> { juiceSubject }
  var strawberryStockObservable: Observable<String> { strawberryStockSubject }
  var bananaStockObservable: Observable<String> { bananaStockSubject }
  var pineappleStockObservable: Observable<String> { pineappleStockSubject }
  var kiwiStockObservable: Observable<String> { kiwiStockSubject }
  var mangoStockObservable: Observable<String> { mangoStockSubject }
  
  init(
    juiceMaker: JuiceMakable,
    fruitStore: FruitStorable
  ) {
    self.juiceMaker = juiceMaker
    self.fruitStore = fruitStore
    
    loadFruitStock()
  }
  
  func loadFruitStock() {
    guard let strawberryStock = fruitStore.stock(of: .strawberry),
          let bananaStock = fruitStore.stock(of: .banana),
          let pineappleStock = fruitStore.stock(of: .pineapple),
          let kiwiStock = fruitStore.stock(of: .kiwi),
          let mangoStock = fruitStore.stock(of: .mango)
    else { return }
    
    strawberryStockSubject.onNext(String(strawberryStock))
    bananaStockSubject.onNext(String(bananaStock))
    pineappleStockSubject.onNext(String(pineappleStock))
    kiwiStockSubject.onNext(String(kiwiStock))
    mangoStockSubject.onNext(String(mangoStock))
  }
  
  func order(juice: Juice) {
    do {
      try juiceMaker.make(juice: juice)
      juiceSubject.onNext(.success(juice))
      loadFruitStock()
    } catch {
      juiceSubject.onNext(.failure(.notEnoughStock))
    }
  }
}
