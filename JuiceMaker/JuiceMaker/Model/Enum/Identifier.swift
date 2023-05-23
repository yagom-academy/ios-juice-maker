//
//  JuiceMaker - Identifier.swift
//  Created by Minseong Kang on 2023/05/23.
//  last modified by maxhyunm, kobe
//

enum Identifier {
	case stockViewController
	case mainViewController
	case mainStoryboard
	
	var name: String {
		switch self {
		case .stockViewController:
			return "StockViewController"
		case .mainViewController:
			return "MainViewController"
		case .mainStoryboard:
			return "Main"
		}
	}
	
}
