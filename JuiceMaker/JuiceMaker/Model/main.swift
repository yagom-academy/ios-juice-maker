//
//  main.swift
//  JuiceMaker
//
//  Created by 맹선아 on 2022/08/29.
//

import Foundation




let myJuiceMaker = JuiceMaker()
myJuiceMaker.makeJuice(.strawberryBananaJuice, total: 1)

print(myJuiceMaker.fruitStore.fruitStock)

//myJuiceMaker.makeJuice(.mangoKiwiJuice, total: 1)
//
//print(myJuiceMaker.fruitStore.fruitStock)
