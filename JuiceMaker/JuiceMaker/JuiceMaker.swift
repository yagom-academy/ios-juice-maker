//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMakerError: Error {
    case invalidInput(message: String)
}

struct JuiceMaker {
    private var strawberry: UInt = 0
    private var banana: UInt = 0
    private var pineapple: UInt = 0
    private var kiwi: UInt = 0
    private var mango: UInt = 0
    
    var strawberryCount: UInt {
        get { return self.strawberry }
    }
    var bananaCount: UInt {
        get { return self.banana }
    }
    var pineappleCount: UInt {
        get { return self.pineapple }
    }
    var kiwiCount: UInt {
        get { return self.kiwi }
    }
    var mangoCount: UInt {
        get { return self.mango }
    }
    
    init(strawberry: UInt = 10, banana: UInt = 10, pineapple: UInt = 10, kiwi: UInt = 10, mango: UInt = 10) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    /// 원하는 쥬스 이름을 입력하면 쥬스를 만드는 함수
    ///
    /// - Parameter name: 쥬스 이름
    /// - Throws: 잘못된 쥬스 이름 전달 되면 'JuiceMakerError.invalidInput(message)'
    /// - Returns:쥬스를 만들었으면 true 아니면 false 반환
    mutating func makeJuice(name: String) throws -> Bool {
        switch name {
        case "딸기쥬스":
            if self.strawberry >= 16 {
                self.strawberry -= 16
                return true
            } else {
                return false
            }
        case "바나나쥬스":
            if self.banana >= 2 {
                self.banana -= 2
                return true
            } else {
                return false
            }
        case "키위쥬스":
            if self.kiwi >= 3 {
                self.kiwi -= 3
                return true
            } else {
                return false
            }
        case "파인애플쥬스":
            if self.pineapple >= 2 {
                self.pineapple -= 2
                return true
            } else {
                return false
            }
        case "딸바쥬스":
            if self.strawberry >= 10 && self.banana >= 1 {
                self.strawberry -= 10
                self.banana -= 1
                return true
            } else {
                return false
            }
        case "망고쥬스":
            if self.mango >= 3 {
                self.mango -= 3
                return true
            } else {
                return false
            }
        case "망고키위쥬스":
            if self.mango >= 2 && self.kiwi >= 1 {
                self.mango -= 2
                self.kiwi -= 1
                return true
            } else {
                return false
            }
        default:
            throw JuiceMakerError.invalidInput(message: "잘못된 입력입니다. 존재하지 않는 쥬스 입니다.")
        }
    }
    
    /// 딸기 재고 개수를 입력값만큼 더함.
    ///
    /// - Parameter count: 더할 딸기 재고 개수
    mutating func addStrawberry(count: UInt) {
        self.strawberry += count
    }
    
    /// 딸기 재고 개수를 입력값만큼 뺌.
    ///
    /// - Parameter count: 뺄 딸기 재고 개수
    /// - Throws: 잘못된 개수(현재 개수보다 많은 개수)가 전달되면  'JuiceMakerError.invalidInput(message)'
    mutating func subtractStrawberry(count: UInt) throws {
        guard self.strawberry < count else {
            throw JuiceMakerError.invalidInput(message: "잘못된 입력입니다. 현재 개수보다 많은 개수는 뺄 수 없습니다.")
        }
        
        self.strawberry -= count
    }
    
    /// 바나나 재고 개수를 입력값만큼 더함.
    ///
    /// - Parameter count: 더할 바나나 재고 개수
    mutating func addBanana(count: UInt) {
        self.banana += count
    }
    
    /// 바나나 재고 개수를 입력값만큼 뺌.
    ///
    /// - Parameter count: 뺄 바나나 재고 개수
    /// - Throws: 잘못된 개수(현재 개수보다 많은 개수)가 전달되면  'JuiceMakerError.invalidInput(message)'
    mutating func subtractBanana(count: UInt) throws {
        guard self.banana < count else {
            throw JuiceMakerError.invalidInput(message: "잘못된 입력입니다. 현재 개수보다 많은 개수는 뺄 수 없습니다.")
        }
        
        self.banana -= count
    }
    
    /// 파인애플 재고 개수를 입력값만큼 더함.
    ///
    /// - Parameter count: 더할 파인애플 재고 개수
    mutating func addPineapple(count: UInt) {
        self.pineapple += count
    }
    
    /// 파인애플 재고 개수를 입력값만큼 뺌.
    ///
    /// - Parameter count: 뺄 파인애플 재고 개수
    /// - Throws: 잘못된 개수(현재 개수보다 많은 개수)가 전달되면  'JuiceMakerError.invalidInput(message)'
    mutating func subtractPineapple(count: UInt) throws {
        guard self.pineapple < count else {
            throw JuiceMakerError.invalidInput(message: "잘못된 입력입니다. 현재 개수보다 많은 개수는 뺄 수 없습니다.")
        }
        
        self.pineapple -= count
    }
    
    /// 키위 재고 개수를 입력값만큼 더함.
    ///
    /// - Parameter count: 더할 키위 재고 개수
    mutating func addKiwi(count: UInt) {
        self.kiwi += count
    }
    
    /// 키위 재고 개수를 입력값만큼 뺌.
    ///
    /// - Parameter count: 뺄 키위 재고 개수
    /// - Throws: 잘못된 개수(현재 개수보다 많은 개수)가 전달되면  'JuiceMakerError.invalidInput(message)'
    mutating func subtractKiwi(count: UInt) throws {
        guard self.kiwi < count else {
            throw JuiceMakerError.invalidInput(message: "잘못된 입력입니다. 현재 개수보다 많은 개수는 뺄 수 없습니다.")
        }
        
        self.kiwi -= count
    }
    
    /// 망고 재고 개수를 입력값만큼 더함.
    ///
    /// - Parameter count: 더할 망고 재고 개수
    mutating func addMange(count: UInt) {
        self.mango += count
    }
    
    /// 망고 재고 개수를 입력값만큼 뺌.
    ///
    /// - Parameter count: 뺄 망고 재고 개수
    /// - Throws: 잘못된 개수(현재 개수보다 많은 개수)가 전달되면  'JuiceMakerError.invalidInput(message)'
    mutating func subtractMango(count: UInt) throws {
        guard self.mango < count else {
            throw JuiceMakerError.invalidInput(message: "잘못된 입력입니다. 현재 개수보다 많은 개수는 뺄 수 없습니다.")
        }
        
        self.mango -= count
    }
}
