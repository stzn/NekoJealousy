//
//  AdaptiveViewContainer.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

struct AdaptiveViewContainer: AdaptiveElement {
    
    let traitCollection: UITraitCollection
    unowned let parent: UIView
    let child: UIView
    
    func update(for incomingTraitCollection: UITraitCollection) {
        if incomingTraitCollection.containsTraits(in: traitCollection) {
            if child.superview != parent {
                parent.addSubview(child)
            }
        } else {
            if child.superview != nil {
                child.removeFromSuperview()
            }
        }
    }
}
