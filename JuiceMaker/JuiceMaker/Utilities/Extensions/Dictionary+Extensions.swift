//
//  Dictionary+Extensions.swift
//  JuiceMaker
//
//  Created by Ryan-Son on 2022/02/16.
//

extension Dictionary where Value: Numeric {
    static func - (lhs: Self, rhs: Self) -> Self {
        var dictionary = lhs

        for (key, value) in rhs {
            let existingValueForKey = dictionary[key] ?? 0
            dictionary.updateValue(existingValueForKey - value, forKey: key)
        }

        return dictionary
    }
}
