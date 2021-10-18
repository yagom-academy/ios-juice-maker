//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var e = kk()
    
}



class kk {
    var fruitstore:[(fruit:String, akmount:Int)] =  []
    enum Fruit :CaseIterable{
        case qq,ww,ee,rr,tt
    
    init(){
        Fruit.allCases.forEach{
            fruitstore += [(fruit: "\($0)", akmount:10)]
        }
    }
    }
    
}

