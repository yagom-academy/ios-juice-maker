//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var strawberry = 10
    private var banana = 10
    private var pineapple = 10
    private var kiwi = 10
    private var mango = 10
}

extension FruitStore {
    
    func pickUpFruits(for menu: FruitJuice) -> PickUpFruitResult {
        var selectedStrawberry = 0
        var selectedBanana = 0
        var selectedPineapple = 0
        var selectedKiwi = 0
        var selectedMango = 0
        
        switch menu {
        case .strawberry:
            selectedStrawberry += 16
        case .banana:
            selectedBanana += 2
        case .kiwi:
            selectedKiwi += 3
        case .pineapple:
            selectedPineapple += 2
        case .strawberryAndBanana:
            selectedStrawberry += 10
            selectedBanana += 1
        case .mango:
            selectedMango += 3
        case .mangoAndKiwi:
            selectedKiwi += 1
            selectedMango += 2
        }
        
        return useFruits(strawberry: selectedStrawberry,
                               banana: selectedBanana,
                               pineapple: selectedPineapple,
                               kiwi: selectedKiwi,
                               mango: selectedMango)
    }
    
    private func useFruits(strawberry: Int, banana: Int, pineapple: Int, kiwi: Int, mango: Int) -> PickUpFruitResult {
        guard self.strawberry >= strawberry,
              self.banana >= banana,
              self.pineapple >= pineapple,
              self.kiwi >= kiwi,
              self.mango >= mango else {
            return PickUpFruitResult.failure
        }
        
        self.strawberry -= strawberry
        self.banana -= banana
        self.pineapple -= pineapple
        self.kiwi -= kiwi
        self.mango -= mango
        return PickUpFruitResult.success
    }
}
