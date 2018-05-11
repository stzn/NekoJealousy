//
//  ForceTouch.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

enum ForceTouch: AdaptiveAttribute {
    
    case unavailable
    case available
    
    func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .unavailable: return UITraitCollection(forceTouchCapability: .unavailable)
        case .available: return UITraitCollection(forceTouchCapability: .available)
        }
    }
}
