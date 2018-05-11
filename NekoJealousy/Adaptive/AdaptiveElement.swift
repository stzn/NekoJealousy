//
//  AdaptiveElement.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

protocol AdaptiveElement {
    
    var traitCollection: UITraitCollection { get }
    
    func update(for incomingTraitCollection: UITraitCollection)
}
