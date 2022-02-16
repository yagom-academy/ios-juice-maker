//
//  Array+Extensions.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/16.
//

extension Array where Element: Hashable {
    typealias Key = Element

    /// 배열의 요소를 Key로 가지는 딕셔너리로 생성합니다.
    /// 모든 Key 동일한 초기값을 가지도록 합니다.
    func toDictionary<Value: Numeric>(with initialValue: Value) -> [Key: Value] {
        var dictionary: [Key: Value] = [:]

        for key in self {
            dictionary[key] = initialValue
        }

        return dictionary
    }
}
