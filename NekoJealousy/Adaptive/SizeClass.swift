//
//  SizeClass.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

enum SizeClass: AdaptiveAttribute {
    
    case horizontalCompact
    case horizontalRegular
    case verticalCompact
    case verticalRegular
    
    func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .horizontalCompact: return UITraitCollection(horizontalSizeClass: .compact)
        case .horizontalRegular: return UITraitCollection(horizontalSizeClass: .regular)
        case .verticalCompact: return UITraitCollection(verticalSizeClass: .compact)
        case .verticalRegular: return UITraitCollection(verticalSizeClass: .regular)
        }
    }
}
