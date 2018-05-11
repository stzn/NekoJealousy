//
//  AdaptiveConstraintContainer.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

struct AdaptiveConstraintContainer: AdaptiveElement {
    
    let traitCollection: UITraitCollection
    let constraints: [NSLayoutConstraint]
    
    func update(for incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraits(in:  traitCollection) {
            NSLayoutConstraint.activate(constraints)
        } else {
            NSLayoutConstraint.deactivate(constraints)
        }
    }
    
}

