//
//  JuiceButton.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/12.
//

import Foundation
import UIKit
class JuiceButton: UIButton {
    var juice: Juice = JuiceType.strawberry
    //var fruit: StockLabel =
    
    func make(_ menu: Juice) {
        JuiceMaker.shared.make(menu)
    }
    
//FIXME: 원래는 이렇게 커스텀 버튼의 메서드로 Alert를 구현하려 했는데 present 함수를 여기서 호출할 수 없었다.. 어떻게 하면 해결할 수 있을까? -> 일단 UIViewController의 메서드이기 때문에 안됐던 거다.
    // 아 이거 그럼 무조건 ViewController 가서 해야되나..
    
}
