//
//  CompositionContainer.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/03/07.
//

final class CompositionContainer {
    static let shared = CompositionContainer()
    var dependencies: [String: Any] = [:]
    
    private init() {
        
    }
    
    func register<T>(_ dependency: T) {
        let key = String(describing: type(of: T.self))
        dependencies.updateValue(dependency, forKey: key)
    }
    
    func resolve<T>() -> T {
        let key = String(describing: type(of: T.self))
        
        let dependency = dependencies[key]
        
        precondition(dependency != nil, "\(key)는 register되지 않았어어요. resolve 부르기전에 register 해주세요")
        
        return dependency as! T
        
        
    }
}
