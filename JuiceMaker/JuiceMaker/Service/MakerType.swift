//
//  MakerType.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/19.
//

import Foundation

protocol MakerType {
    func makeDrink(_ drink: Drinkable) throws -> Drinkable
}
