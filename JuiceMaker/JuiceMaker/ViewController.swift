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
  
  func getAlert(message: String) {
    let alert = UIAlertController(
      title: "",
      message: message,
      preferredStyle: UIAlertController.Style.alert)
    
    alert.addAction(UIAlertAction(
                      title: "확인",
                      style: .default))
    present(alert, animated: false, completion: nil)
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
    
    getAlert(message: juiceMaker.make(of: orderedJuice))
  }
  
}

