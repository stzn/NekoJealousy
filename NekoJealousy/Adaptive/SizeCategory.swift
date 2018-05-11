//
//  SizeCategory.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

enum SizeCategory: AdaptiveAttribute {
    
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case extraExtraLarge
    case extraExtraExtraLarge
    case accessibilityMedium
    case accessibilityLarge
    case accessibilityExtraLarge
    case accessibilityExtraExtraLarge
    case accessibilityExtraExtraExtraLarge
    
    func generateTraitCollection() -> UITraitCollection {
        switch self {
        case .extraSmall: return UITraitCollection(preferredContentSizeCategory: .extraSmall)
        case .small: return UITraitCollection(preferredContentSizeCategory: .small)
        case .medium: return UITraitCollection(preferredContentSizeCategory: .medium)
        case .large: return UITraitCollection(preferredContentSizeCategory: .large)
        case .extraLarge: return UITraitCollection(preferredContentSizeCategory: .extraLarge)
        case .extraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .extraExtraLarge)
        case .extraExtraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .extraExtraExtraLarge)
        case .accessibilityMedium: return UITraitCollection(preferredContentSizeCategory: .accessibilityMedium)
        case .accessibilityLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityLarge)
        case .accessibilityExtraLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityExtraLarge)
        case .accessibilityExtraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraLarge)
        case .accessibilityExtraExtraExtraLarge: return UITraitCollection(preferredContentSizeCategory: .accessibilityExtraExtraExtraLarge)
        }
    }
}
