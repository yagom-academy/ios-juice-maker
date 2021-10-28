//
//  DataFormatConverter.swift
//  JuiceMaker
//
//  Created by 황제하 on 2021/10/28.
//

import Foundation

struct DataFormatConverter {
    func convert(using fruitAndQuantity: [Fruit: Int]) -> String {
        let resultString = fruitAndQuantity.map( {"과일: \($0), 개수: \(abs($1))\n"} ).reduce("") {$0 + $1}
        
        return resultString
    }
}
