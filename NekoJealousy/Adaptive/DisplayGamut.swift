//
//  DisplayGamut.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

enum DisplayGamut: AdaptiveAttribute {
    
    case SRGB
    case P3
    
    func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .SRGB: return UITraitCollection(displayGamut: .SRGB)
        case .P3: return UITraitCollection(displayGamut: .P3)
        }
    }
}
