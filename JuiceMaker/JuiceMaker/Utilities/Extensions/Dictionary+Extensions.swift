//
//  Dictionary+Extensions.swift
//  JuiceMaker
//
//  Created by Derrick, Ryan-Son on 2022/02/16.
//

extension Dictionary where Value: Numeric {
    /// 딕셔너리의 Key 값을 기준으로 value간의 빼기 연산을 수행합니다.
    /// 연산자의 오른편에 있는 요소의 키가 왼쪽편에 있는 요소에 없으면 해당 키를 추가하여 연산을 수행합니다. 키가 없다면 기본 값은 0입니다.
    ///
    /// - Parameters:
    ///   - lhs: 기준이 될 딕셔너리
    ///   - rhs: 비교를 위한 딕셔너리
    ///   
    /// - Returns :현재 재고에서 소진 될 재료의 개수를 뺀 딕셔너리 반환
    static func - (lhs: Self, rhs: Self) -> Self {
        var calculated = lhs
        
        for (key, value) in rhs {
            let existingValueForKey = calculated[key] ?? 0
            calculated.updateValue(existingValueForKey - value, forKey: key)
        }
        
        return calculated
    }
}
