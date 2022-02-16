//
//  Dictionary+Extensions.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/16.
//

extension Dictionary where Value: Numeric {
    /// 딕셔너리의 Key 값을 기준으로 value간의 빼기 연산을 수행합니다.
    /// 연산자의 오른편에 있는 요소의 키가 왼쪽편에 있는 요소에 없을 때 해당 키를 추가하여 연산을 수행합니다.
    static func - (lhs: Self, rhs: Self) -> Self {
        var calculated = lhs

        for (key, value) in rhs {
            let existingValueForKey = calculated[key] ?? 0
            calculated.updateValue(existingValueForKey - value, forKey: key)
        }

        return calculated
    }
}
