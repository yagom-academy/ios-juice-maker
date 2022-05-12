//
//  ManangingOrderDelegate.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/05/09.
//

import Foundation
import UIKit

protocol StoreViewDelegate: AnyObject {
    func stepperValueDidChanged(_ viewController: StoreViewController, fruit: FruitType, with amount: Int)
    func didCanceledStoreViewController(_ viewController: StoreViewController)
}

final class StoreViewManager {
    weak var delegate: StoreViewDelegate?
    
    func stepperValueDidChanged(viewcontroller: StoreViewController, fruit: FruitType, with amount: Int) {
        self.delegate?.stepperValueDidChanged(viewcontroller, fruit: fruit, with: amount)
    }
    
    func didCanceled(viewcontroller: StoreViewController) {
        self.delegate?.didCanceledStoreViewController(viewcontroller)
    }
}
