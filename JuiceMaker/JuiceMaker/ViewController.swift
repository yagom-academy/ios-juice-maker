//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
  let juiceMaker = JuiceMaker()
    
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func getAlert(_ isSuccess: Bool, _ message: String) {
    let alert = UIAlertController(title: "",
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    
    let btnOK = UIAlertAction(title: "확인",
                              style: .default)
    let btnMove = UIAlertAction(title: "예",
                                style: .default) { (action) in
      print("화면이동")
    }
    let btnCancel = UIAlertAction(title: "아니오",
                                  style: .cancel)
    
    if(isSuccess) {
      alert.addAction(btnOK)
    } else {
      alert.addAction(btnMove)
      alert.addAction(btnCancel)
    }
    
    present(alert,
            animated: false,
            completion: nil)
  }
  
  @IBAction func orderJuice(_ sender: UIButton) {
    guard let buttonTitle = sender.titleLabel else {
      return
    }
    guard let buttonTitleText = buttonTitle.text else {
      return
    }
    let juiceName = buttonTitleText.replacingOccurrences(of: " 주문", with: "")
    guard let orderedJuice = Juice(rawValue: juiceName) else {
      return
    }
    
    guard let isSuccess: Bool = juiceMaker.make(of: orderedJuice)["isSuccess"] as? Bool else {
      return
    }
    guard let message: String = juiceMaker.make(of: orderedJuice)["message"] as? String else {
      return
    }
    getAlert(isSuccess, message)
  }
  
}

