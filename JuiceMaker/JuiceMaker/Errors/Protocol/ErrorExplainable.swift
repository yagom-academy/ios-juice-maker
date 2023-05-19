//
//  ErrorExplainable.swift
//  JuiceMaker
//
//  Created by 김민성 on 2023/05/19.
//

import Foundation

protocol ErrorExplainable {
    var title: String { get }
    var description: String { get }
}
