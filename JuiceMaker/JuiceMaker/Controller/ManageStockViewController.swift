//
//  ManageStockViewController.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/26.
//

import UIKit

class ManageStockViewController: UIViewController {

    var deliverdAllStock = [String]()
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backgroundColor = .systemGray5
        
        strawberryQuantityLabel.text = deliverdAllStock[0]
        bananaQuantityLabel.text = deliverdAllStock[1]
        pineappleQuantityLabel.text = deliverdAllStock[2]
        kiwiQuantityLabel.text = deliverdAllStock[3]
        mangoQuantityLabel.text = deliverdAllStock[4]
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
