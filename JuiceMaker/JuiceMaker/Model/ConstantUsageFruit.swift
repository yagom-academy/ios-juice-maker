//
//  ConstantNameSpace.swift
//  JuiceMaker
//
//  Created by Kyo, TaeLee on 2022/09/01.
//

enum ConstantUsageFruit {
    static let strawberry: Int = 16
    static let banana: Int = 2
    static let pineapple: Int = 2
    static let kiwi: Int = 3
    static let mango: Int = 3
    static let strawberryBanana: (strawberry: Int, banana: Int) = (10, 1)
    static let mangoKiwi: (mango: Int, kiwi: Int) = (2, 2)
    static let invalidFruit: Int = -1
}
