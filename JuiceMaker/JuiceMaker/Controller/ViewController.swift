//
//  JuiceMaker - ViewController.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //노티의 옵저버 등록(가마)
        //스토리보드로 구성한 뷰 요소의 초기값을 설정하는 요소
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //View에 보여줄 데이터 호출
        //노래 재생
        //노티의 옵저버 등록(디아나)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //화면에 적용되는 애니메이션 적용
        //사용자 환영 애니메이션
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        //노래 정지
        //노티의 옵저버 등록(디아나)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        //노티의 옵저버 등록 해제(가마)
    }
}
