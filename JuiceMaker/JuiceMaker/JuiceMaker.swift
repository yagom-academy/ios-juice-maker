//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice: String {
    case 딸기쥬스 = "{\"Strawberry\":16}"
    case 바나나쥬스 = "{\"Banana\":2}"
    case 키위쥬스 = "{\"Kiwi\":3}"
    case 파인애플쥬스 = "{\"Pineapple\":2}"
    case 딸바쥬스 = "{\"Strawberry\":10},{\"Banana\":1}"
    case 망고쥬스 = "{\"Mango\":3}"
    case 망고키위쥬스 = "{\"Mango\":2},{\"Kiwi\":1}"
}

class JuiceMaker {
    private let stockOfFruit = StockOfFruit()

    func makeJuice(juice: Juice) {
        if checkEnough(juice, necessaryFruit(juice: juice)) {
            print("\(juice) 나왔습니다! 맛있게 드세요!")
        } else {
            print("재료가 모자라요.")
        }
    }
    
    func necessaryFruit(juice: Juice) -> [String:Int] {
        var necessaryFruit = [String:Int]()
        
        let fruitInfos = juice.rawValue.components(separatedBy: ",")
        var jsonData = [String:Int]()
        for fruitInfo in fruitInfos {
            let data = Data(fruitInfo.utf8)
            do {
                jsonData = try JSONSerialization.jsonObject(
                    with: data, options: []) as! [String : Int]
                
                necessaryFruit.updateValue(jsonData.values.first!, forKey: jsonData.keys.first!)
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        
        print(necessaryFruit)
        
        return necessaryFruit
    }
    
    func checkEnough(_ juice: Juice, _ fruitInfo: [String:Int]) -> Bool {
        let stock = stockOfFruit.total(type: Fruit(rawValue: fruitInfo.keys.first!)!)
        
        if stock! >= fruitInfo.values.first! {
            return true
        } else {
            return false
        }
    }
}
