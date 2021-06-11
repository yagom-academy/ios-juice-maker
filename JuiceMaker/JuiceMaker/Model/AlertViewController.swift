//
//  AlertViewController.swift
//  JuiceMaker
//
//  Created by Jiwon Yoon on 2021/06/11.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
