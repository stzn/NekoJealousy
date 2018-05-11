//
//  LayoutDirection.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

enum LayoutDirection: AdaptiveAttribute {
    
    case leftToRight
    case rightToLeft
    
    func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .leftToRight: return UITraitCollection(layoutDirection: .leftToRight)
        case .rightToLeft: return UITraitCollection(layoutDirection: .rightToLeft)
        }
    }
}
