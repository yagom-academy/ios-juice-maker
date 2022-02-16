//
//  Array+Extensions.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/16.
//

extension Array where Element: Hashable {
    typealias Key = Element

    func toDictionary<Value: Numeric>(with initialValue: Value) -> [Key: Value] {
        var dictionary: [Key: Value] = [:]

        for key in self {
            dictionary[key] = initialValue
        }

        return dictionary
    }
}
