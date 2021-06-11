//
//  Alert.swift
//  JuiceMaker
//
//  Created by Jiwon Yoon on 2021/06/11.
//

import Foundation
import UIKit

enum Message: String {
	case orderSuccess = " 나왔습니다! 맛있게 드세요!"
	case outOfStock = "재료가 모자라요. 재고를 수정할까요?"
}

class Alert: UIViewController {
	static let shared = Alert()
	
	func showOrderSuccessAlert(message: String) {
		let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "네!", style: .default)
		
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}
}
