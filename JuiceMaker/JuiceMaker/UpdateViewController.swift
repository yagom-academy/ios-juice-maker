//
//  UpdateViewController.swift
//  JuiceMaker
//
//  Created by Yunhwa on 2021/03/18.
//

import UIKit

class UpdateViewController: UIViewController {
    
    @IBOutlet var closeSecondView: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func returnView(_ sender: UIBarButtonItem) {
        guard let firstView = self.storyboard?.instantiateViewController(identifier: "firstVC") else { return }
        self.dismiss(animated: true, completion: nil)
    }
}
