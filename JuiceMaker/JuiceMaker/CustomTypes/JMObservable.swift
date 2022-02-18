//
//  JMObservable.swift
//  JuiceMaker
//
//  Created by Dayeon Jung on 2022/02/17.
//

import Foundation

/// 값을 관찰하여 값이 변경되면 미리 지정한 listener에 따라 작업을 수행
class JMObservable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}

