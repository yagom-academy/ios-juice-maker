//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitsDictionary: [String: Int] = ["딸기": 10, "바나나": 10, "파인애플": 10, "키위": 10, "망고": 10]
    
    func printErrorMessage() {
        do { try getUserInput()
        } catch InputError.invalidInputError {
            print("잘못된 입력입니다.")
        } catch {
            print("알수없는 오류가 발생하였습니다.")
        }
        
        do { try inputFruit()
        } catch InputError.invalidInputError {
            print("잘못된 입력입니다.")
        } catch {
            print("알수없는 오류가 발생하였습니다.")
        }
        
        do { try changeFruitsNumber()
        } catch InputError.invalidInputError {
            print("잘못된 입력입니다.")
        } catch {
            print("알수없는 오류가 발생하였습니다.")
        }
    }
    
    func getUserInput() throws -> String {
        guard let userInput: String = readLine() else { throw InputError.invalidInputError }
        
        return userInput
    }
    
    func inputFruit() throws -> String {
        print("과일을 입력해주세요: ", terminator: "")
        let fruit: String = try getUserInput()
        guard let _ = fruitsDictionary[fruit] else { throw InputError.invalidInputError }
        
        return fruit
    }
    
    func changeFruitsNumber() throws {
        let inputFruits = try inputFruit()
        
        print("변경할 개수를 입력해주세요.: ", terminator: "")
        let userInput = try getUserInput()
        guard let number = Int(userInput) else { throw InputError.invalidInputError }
        fruitsDictionary[inputFruits] = number
    }
    
    func checkStoock() {
        
    }
}


