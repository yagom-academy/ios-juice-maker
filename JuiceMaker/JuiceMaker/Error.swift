//
//  Error'.swift
//  JuiceMaker
//
//  Created by 강경, Ryan on 2021/03/11.
//

import Foundation

enum FruitError: Error, CustomStringConvertible {
  case nilHasOccurredWhileSubtracting
  case nilHasOccurredWhileAdding
  case nilHasOccurredWhileCheckingStock
  case nilHasOccurredWhileCountingStock
  
  var description: String {
    switch self {
    case .nilHasOccurredWhileSubtracting:
      return "🔥 쥬스 재고 차감 중 stock[fruit] = nil이 발생하였습니다."
    case .nilHasOccurredWhileAdding:
      return "🔥 쥬스 재고 추가 중 stock[fruit] = nil이 발생하였습니다."
    case .nilHasOccurredWhileCheckingStock:
      return "🔥 쥬스 재고 확인 중 stock[fruit] = nil이 발생하였습니다."
    case .nilHasOccurredWhileCountingStock:
      return "🔥 쥬스 재고 반환 중 stock[fruit] = nil이 발생하였습니다."
    }
  }
}

enum JuiceError: Error, CustomStringConvertible {
  case nilHasOccurredWhileCheckingRequiredFruits
  
  var description: String {
    switch self {
    case .nilHasOccurredWhileCheckingRequiredFruits:
      return "🔥 우리 가게에 없는 쥬스군요."
    }
  }
}

enum RecipeError: Error, CustomStringConvertible {
  case jsonDecodingFailed
  case nilHasOccurredWhileUnwrappingRecipe
  case canNotFindJSONPath
  case failedToConvertJSONAsDataFormat
  
  var description: String {
    switch self {
    case .jsonDecodingFailed:
      return "JSON 디코딩 작업에 실패하여 레시피를 읽어 들이지 못했습니다."
    case .nilHasOccurredWhileUnwrappingRecipe:
      return "레시피를 가져오는 과정에서 옵셔널 해제에 실패했습니다."
    case .canNotFindJSONPath:
      return "지정된 경로에 JSON파일이 없습니다."
    case .failedToConvertJSONAsDataFormat:
      return "JSON을 데이터로 변환하는데 실패하였습니다."
    }
  }
}
