import UIKit

class EditFruitStockViewController: UIViewController {
    private var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationButton()
    }
    
    fileprivate func configureNavigationButton() {
        navigationItem.title = "재고 추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(hitDoneButton))
    }
    
    @objc
    func hitDoneButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configure(juiceMaker: JuiceMaker) {
        self.juiceMaker = juiceMaker
    }
}



