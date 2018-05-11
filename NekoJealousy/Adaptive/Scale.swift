//
//  Scale.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

enum Scale: AdaptiveAttribute {
    
    case oneX
    case twoX
    case threeX
    case fourX
    
    func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .oneX: return UITraitCollection(displayScale: 1.0)
        case .twoX: return UITraitCollection(displayScale: 2.0)
        case .threeX: return UITraitCollection(displayScale: 3.0)
        case .fourX: return UITraitCollection(displayScale: 4.0)
        }
    }
}
