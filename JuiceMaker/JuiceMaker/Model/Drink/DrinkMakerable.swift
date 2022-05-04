//
//  DrinkMakerable.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/04/28.
//

import Foundation
import UIKit

protocol DrinkMakerable {
    func make(_ beverage: Drink) -> Result<JuiceType, StockError>
    func count(_ fruit: Fruit) -> String
}
