//
//  AdaptiveBehavior.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

struct AdaptiveBehavior: AdaptiveElement {
    
    typealias Behavior = () -> Void
    
    let traitCollection: UITraitCollection
    let behavior: Behavior
    let counterBehavior: Behavior?
    
    func update(for incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraits(in: traitCollection) {
            behavior()
        } else {
            counterBehavior?()
        }
    }
}
