# ios-juice-maker
iOS 쥬스 메이커 재고관리 시작 저장소

## 쥬스메이커 프로젝트 - 팀그라운드룰

### 팀원

@kyung kang 

@Ryan Son 

### ****우리 팀만의 규칙****

- TIL 작성은 다음날 오전까지 작성한다.

### ****스크럼****

- 매일 9시 10분에 스크럼을 진행한다
- 최대 20분을 초과하지 않도록 한다.
- 어제 한 일, 오늘 할 일, 컨디션, 기술적 이슈

### ****프로젝트****

- 브랜치 이름 규칙: 닉네임 다음에 스텝 번호를 기술

    예) kangkyung-step-1, ryan-step-2

- 커밋 메시지 규칙
    - [https://junwoo45.github.io/2020-02-06-commit_template/](https://junwoo45.github.io/2020-02-06-commit_template/)

    ```swift
    # <타입>: <제목>

    ##### 제목은 최대 50 글자까지만 입력 ############## -> |

    # 본문은 위에 작성
    ######## 본문은 한 줄에 최대 72 글자까지만 입력 ########################### -> |

    # 꼬릿말은 아래에 작성: ex) #이슈 번호

    # --- COMMIT END ---
    # <타입> 리스트
    #   feat    : 기능 (새로운 기능)
    #   fix     : 버그 (버그 수정)
    #   refactor: 리팩토링
    #   style   : 스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없음)
    #   docs    : 문서 (문서 추가, 수정, 삭제)
    #   test    : 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
    #   chore   : 기타 변경사항 (빌드 스크립트 수정 등)
    # ------------------
    #     제목 첫 글자를 대문자로
    #     제목은 명령문으로
    #     제목 끝에 마침표(.) 금지
    #     제목과 본문을 한 줄 띄워 분리하기
    #     본문은 "어떻게" 보다 "무엇을", "왜"를 설명한다.
    #     본문에 여러줄의 메시지를 작성할 땐 "-"로 구분
    # ------------------
    ```

    - 설계

    ```swift
    struct FruitInStock {
    	private(set) var fruitInStock = [Int](repeating: 10, count: 5)
    	
    	/// 과일 재고 읽기 
    	func readFruitStock() {
    	
    	}

    	*/// 과일재고 추가함수
    	fu*nc addFruit() {

    	}

    	*/// 과일재고 삭제함수
    	fu*nc deleteFruit() {

    	}
    }

    struct JuiceMaker {
    	/// 과일재고 가져오기
    	let fruitInStock = FruitInStock()

    	/// 과일쥬스 제조함수
    	*func makeJuice() {

    	}*
    }

    class JuiceMakerView {

    }
    ```

    - 코드 스타일

    [https://github.com/StyleShare/swift-style-guide](https://github.com/StyleShare/swift-style-guide)

    # 타임라인

    - 1주차
        - 월 - 팀그라운드룰 설정, step 1 의사코드 설계, step 1 각자 코딩해보기
        - 화 - step 1 코드리뷰 및 미완성부분 보완
        - 수 - 서로의 step1 코드리뷰 및 피드백 적용
            1. class와 struct 차이
            2. ! -> ? 옵셔널바인딩
            3. enum 간접호출
            4. 접근제어자
            5. guard let error처리
            6. MARK 사용
            7. 콜론규칙 적용
            8. 가독성처리(메소드명, 프로퍼티명) 네이밍 변경
        - 목 - 오류해결 및 Step 1 PR
        - 금 - 코드리뷰 피드백 방안 논의, 커스텀 타입 디코딩 이슈 해결 및 타입별 수행 기능 전체 재검토 
        - 토 - 익일 논의 결과 바탕으로 전체 코드 리팩터링, 리뷰어 피드백에 대한 코멘트 및 수정 결과물 push
        - 일 - 각자 step2 작성해보기, TWL 진행
    - 2주차
        - 월 - 리뷰어 피드백에 대한 코멘트 논의
        - 화 - 피드백에 대한 코멘트 및 수정 결과물 push
        - 수 -
        - 목 -
        - 금 -
