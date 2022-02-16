//
//  Array+Extensions.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/16.
//

extension Array where Element: Hashable {
    typealias Key = Element

    /// 배열의 요소를 Key로 가지는 딕셔너리를 생성합니다.
    /// 모든 Key에 동일한 초기값을 가지도록 설정합니다.
    func toDictionary<Value>(with initialValue: Value) -> [Key: Value] {
        var converted: [Key: Value] = [:]

        for key in self {
            converted[key] = initialValue
        }

        return converted
    }
}
