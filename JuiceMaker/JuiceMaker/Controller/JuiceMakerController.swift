import UIKit

class JuiceMakerController: UIViewController {
    @IBOutlet weak var modifyStockButton: UIBarButtonItem!
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    private var juiceMaker: JuiceMaker = JuiceMaker()
    private var menuList: MenuList = MenuList(strawberryJuice: [JuiceMenu.recipe(.strawberry, 16)],
                                      bananaJuice: [JuiceMenu.recipe(.banana, 3)],
                                      pineappleJuice: [JuiceMenu.recipe(.pineapple, 2)],
                                      kiwiJuice: [JuiceMenu.recipe(.kiwi, 3)],
                                      mangoJuice: [JuiceMenu.recipe(.mango, 3)],
                                      strawberryBananaJuice: [JuiceMenu.recipe(.strawberry, 10), JuiceMenu.recipe(.banana, 1)],
                                      mangoKiwiJuice: [JuiceMenu.recipe(.mango, 2), JuiceMenu.recipe(.kiwi, 1)])
    
    enum AlertType {
        case yes
        case yesAndNo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initFruitStockLabel()
    }
    
    @IBAction func modifyStockButtonTapped(_ sender: Any) {
        moveToModifyStockViewController()
    }
    
    @IBAction func orderStrawberryJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.strawberryJuice, menuName: "딸기")
    }
    
    @IBAction func orderBananaJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.bananaJuice, menuName: "바나나")
    }
    
    @IBAction func orderStrawberryBananaJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.strawberryBananaJuice, menuName: "딸기바나나")
    }
    
    @IBAction func orderPineappleJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.pineappleJuice, menuName: "파인애플")
    }
    
    @IBAction func orderMangoJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.mangoJuice, menuName: "망고")
    }
    
    @IBAction func orderKiwiJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.kiwiJuice, menuName: "키위")
    }
    
    @IBAction func orderMangoKiwiJuice(_ sender: UIButton) {
        tryMakingJuice(menu: menuList.mangoKiwiJuice, menuName: "망고키위")
    }
    
    func initFruitStockLabel() {
        for fruit in FruitCategory.allCases {
            let fruitCount = String(juiceMaker.manageFruitStore(fruit: fruit))
            
            switch fruit {
            case .strawberry:
                self.strawberryStockLabel.text = fruitCount
            case .banana:
                self.bananaStockLabel.text = fruitCount
            case .pineapple:
                self.pineappleStockLabel.text = fruitCount
            case .kiwi:
                self.kiwiStockLabel.text = fruitCount
            case .mango:
                self.mangoStockLabel.text = fruitCount
            }
        }
    }
    
    func tryMakingJuice(menu: [JuiceMenu], menuName: String) {
        do {
            try juiceMaker.makeJuice(juiceMenu: menu)
            tryConsumeFruit(menu: menu, menuName: menuName)
        } catch FruitStoreError.outOfStock {
            alertMessage(message: "재료가 모자라요. 재고를 수정할까요?", type: .yesAndNo) { _ in
                self.moveToModifyStockViewController()
            }
        } catch FruitStoreError.invalidFruitName {
            alertMessage(message: "유효하지 않은 과일 이름입니다.", type: .yes, handler: nil)
        } catch {
            alertMessage(message: "잘못된 입력입니다.", type: .yes, handler: nil)
        }
    }
    
    func tryConsumeFruit(menu: [JuiceMenu], menuName: String){
        do {
            try juiceMaker.consumeFruit(recipe: menu)
            alertMessage(message: "\(menuName) 쥬스 나왔습니다! 맛있게 드세요!", type: .yes) { _ in
                self.updateMenu(menu: menu)
            }
        } catch FruitStoreError.invalidFruitName {
            alertMessage(message: "유효하지 않은 과일 이름입니다.", type: .yes, handler: nil)
        } catch {
            alertMessage(message: "잘못된 입력입니다.", type: .yes, handler: nil)
        }
    }
    
    func updateMenu(menu: [JuiceMenu]) {
        for fruit in menu {
            switch fruit {
            case .recipe(let fruitName, _):
                self.updateFruitCount(fruitName: fruitName)
            }
        }
    }
    
    func updateFruitCount(fruitName: FruitCategory) {
        let fruitNumberForLabel = String(juiceMaker.manageFruitStore(fruit: fruitName))

        switch fruitName {
        case .strawberry:
            self.strawberryStockLabel.text = fruitNumberForLabel
        case .banana:
            self.bananaStockLabel.text = fruitNumberForLabel
        case .pineapple:
            self.pineappleStockLabel.text = fruitNumberForLabel
        case .kiwi:
            self.kiwiStockLabel.text = fruitNumberForLabel
        case .mango:
            self.mangoStockLabel.text = fruitNumberForLabel
        }
    }
    
    func alertMessage(message: String, type: AlertType, handler: ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        var confirm: UIAlertAction = UIAlertAction()
        var close: UIAlertAction = UIAlertAction()
        
        switch type {
        case .yes:
            confirm = UIAlertAction(title: "예", style: .default, handler: handler)
            
            alert.addAction(confirm)
        case .yesAndNo:
            close = UIAlertAction(title: "아니오", style: .destructive, handler: handler)
            
            alert.addAction(confirm)
            alert.addAction(close)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func moveToModifyStockViewController(){
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ModifyStockViewController") as? ModifyStockViewController else {
            return
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        self.present(navigationController, animated: true)
    }
}
