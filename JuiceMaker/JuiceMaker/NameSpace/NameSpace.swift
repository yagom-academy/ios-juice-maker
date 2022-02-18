//
//  NameSpace.swift
//  JuiceMaker
//
//  Created by Doyoung on 2022/02/17.
//

import Foundation

enum StoryboardName {
    static let main = "Main"
}

enum StoryboardID {
    static let stockModifyViewController = "stockModifyViewControllerID"
}

enum CollectionViewID {
    static let fruitStockCell = "FruitStockCollectionViewCellReuseID"
    static let orderButtonCell = "OrderButtonCollectionViewCellReuseID"
}

enum StoreErrorDescription {
    static let notExistStuff = "%@이 존재하지 않습니다"
    static let unknownError = "알 수 없는 에러"
}

enum AlertTitle {
    static let completeMakeJuice = "%@가 나왔습니다! 맛있게 드세요!"
    static let notEnoughJuice = "%@의 갯수가 %d개 밖에 없어요 재고를 수정할까요?"
    static let faliMakeJuice = "%@가 없어요. 재고를 수정할까요?"
    
    enum action {
        static let submit = "확인"
        static let no = "아니오"
        static let yes = "예"
    }
}

enum NotificationUserInfo {
    static let fruitStore = "fruitStore"
}

enum Stock {
    static var initValue: [Fruit:Int] {
        [.strawberry: 10,
         .pineapple: 10,
         .mango: 10,
         .kiwi: 10,
         .banana: 10]
    }
}

enum InitialCollectionViewLayoutConstant {
    typealias Size = (width: Double, height: Double)
    
    static let minimumLineSpacing = 10
    static let minimumInteritemSpacing = 10
    
    static let fruitStockCellReduceConstant = 10
    
    static func calcFruitStockCellReduceConstant(_ width: Double) -> Double {
        return (width - 10) / 5
    }
    
    static func calcOrderButtonCellReduceConstant(_ width: Double, height: Double) -> Size {
        return Size(width: (width - 20) / 2, height: height / 3)
    }
    
}
