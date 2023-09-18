//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let juiceMaker = JuiceMaker()

    @IBOutlet weak var strawberryCount: UILabel!
    @IBOutlet weak var bananaCount: UILabel!
    @IBOutlet weak var pineappleCount: UILabel!
    @IBOutlet weak var kiwiCount: UILabel!
    @IBOutlet weak var mangoCount: UILabel!
    
    @objc func changeStock(_ noti: NSNotification) {
        print("change!!")
    }
    
    @IBAction func orderStrawberry(_ sender: UIButton) {
        do {
            try juiceMaker.takeOrder(order: .strawberryJuice)
        } catch {
            print("error났어")
        }
    }
    
    @IBAction func goFruitStore(_ sender: UIButton) {
        let JuiceMakerVC = storyboard?.instantiateViewController(identifier: "FruitStoreVC")
        JuiceMakerVC?.modalPresentationStyle = .pageSheet
        JuiceMakerVC?.modalTransitionStyle = .coverVertical
        present(JuiceMakerVC!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        juiceMaker.
        NotificationCenter.default.addObserver(self, selector: #selector(changeStock(_:)), name: Notification.Name("changeStock"), object: nil)
        
    }


}

class FruitStoreVC: UIViewController {

    
    
    @IBAction func goJuiceMaker(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
