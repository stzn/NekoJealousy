//
//  Idiom.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

enum Idiom: AdaptiveAttribute {
    
    case phone
    case pad
    case tv
    case carPlay
    
    func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .phone: return UITraitCollection(userInterfaceIdiom: .phone)
        case .pad: return UITraitCollection(userInterfaceIdiom: .pad)
        case .tv: return UITraitCollection(userInterfaceIdiom: .tv)
        case .carPlay: return UITraitCollection(userInterfaceIdiom: .carPlay)
        }
    }
}

