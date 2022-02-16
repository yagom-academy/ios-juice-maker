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
  
  func order(juice: Juice)
}

class OrderViewModel: OrderViewModelType {
  let juiceMaker: JuiceMakable
  let juiceSubject = PublishSubject<Result<Juice, JuiceMakerError>>()
  
  // output
  
  var juiceObservable: Observable<Result<Juice, JuiceMakerError>> { juiceSubject }
  
  init(juiceMaker: JuiceMakable) {
    self.juiceMaker = juiceMaker
  }
  
  func order(juice: Juice) {
    do {
      try juiceMaker.make(juice: juice)
      juiceSubject.onNext(.success(juice))
    } catch {
      juiceSubject.onNext(.failure(.notEnoughStock))
    }
  }
}
