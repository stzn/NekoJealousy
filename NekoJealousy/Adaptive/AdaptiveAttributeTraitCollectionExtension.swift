//
//  AdaptiveAttributeTraitCollectionExtension.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit


extension UITraitCollection {
    
    static func create(with attributes: [AdaptiveAttribute]) -> UITraitCollection {
        let traitCollections = attributes.map { $0.generateTraitCollection() }
        return self.init(traitsFrom: traitCollections)
    }
    
    func contains(_ attribute: AdaptiveAttribute) -> Bool {
        return containsTraits(in: attribute.generateTraitCollection())
    }
    
}
