//
//  ExtensionViewController.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/18.
//

import UIKit

class ExtensionViewController: UIViewController {
    @IBOutlet var orderStrawberryJuiceButton: UIButton!
    @IBOutlet var orderBananaJuiceButton: UIButton!
    @IBOutlet var orderPineappleJuiceButton: UIButton!
    @IBOutlet var orderKiwiJuiceButton: UIButton!
    @IBOutlet var orderMangoJuiceButton: UIButton!
    @IBOutlet var orderStrawberryBananaJuiceButton: UIButton!
    @IBOutlet var orderMangoKiwiJuiceButton: UIButton!
    @IBOutlet var strawberryCount: UILabel!
    @IBOutlet var bananaCount: UILabel!
    @IBOutlet var pineappleCount: UILabel!
    @IBOutlet var kiwiCount: UILabel!
    @IBOutlet var mangoCount: UILabel!
    var juiceMaker: JuiceMaker = JuiceMaker.shared
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
