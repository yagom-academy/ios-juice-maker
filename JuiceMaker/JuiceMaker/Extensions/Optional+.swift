//
//  Optional+.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/24.
//

extension Optional<String> {
    var toInt: Int? {
        guard let self = self else { return nil }
        
        return Int(self)
    }
    
    var toDouble: Double? {
        guard let self = self.toInt else { return nil }
        
        return Double(self)
    }
}
