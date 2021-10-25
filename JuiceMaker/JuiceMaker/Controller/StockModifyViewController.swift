//
//  StockModifyViewController.swift
//  JuiceMaker
//
//  Created by Jae-hoon Sim on 2021/10/25.
//

import UIKit

class StockModifyViewController: UIViewController {
    var juiceMaker: JuiceMaker? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("성공!")
        print(try! juiceMaker!.currentFruitStock(of: .strawberry))
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
