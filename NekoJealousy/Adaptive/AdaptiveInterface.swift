//
//  AdaptiveInterface.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/11.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

protocol AdaptiveInterface: class, AdaptiveElement {
    
    var adaptiveElements: [AdaptiveElement] { get set }
}

extension AdaptiveInterface {
    
    func update(for incomingTraitCollection: UITraitCollection) {
        adaptiveElements.filter { incomingTraitCollection.containsTraits(in: $0.traitCollection) == false }.forEach { $0.update(for: incomingTraitCollection) }
        adaptiveElements.filter { incomingTraitCollection.containsTraits(in: $0.traitCollection) == true }.forEach { $0.update(for: incomingTraitCollection) }
    }
}

extension AdaptiveInterface {
    
    func addBehavior(for traitCollection: UITraitCollection, behavior: @escaping AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let adaptiveBehavior = AdaptiveBehavior(traitCollection: traitCollection, behavior: behavior, counterBehavior: counterBehavior)
        
        adaptiveElements.append(adaptiveBehavior)
    }
    
    func addBehavior(for attributes: [AdaptiveAttribute], behavior: @escaping AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addBehavior(for: traitCollection, behavior: behavior, counterBehavior: counterBehavior)
    }
    
    func addBehavior(for attribute: AdaptiveAttribute, behavior: @escaping AdaptiveBehavior.Behavior, counterBehavior: AdaptiveBehavior.Behavior? = nil) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addBehavior(for: traitCollection, behavior: behavior, counterBehavior: counterBehavior)
    }
    
    func addConstraints(for traitCollection: UITraitCollection, constraints: [NSLayoutConstraint]) {
        let container = AdaptiveConstraintContainer(traitCollection: traitCollection, constraints: constraints)
        
        adaptiveElements.append(container)
    }
    
    func addConstraints(for attributes: [AdaptiveAttribute], constraints: NSLayoutConstraint...) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addConstraints(for: traitCollection, constraints: constraints)
    }
    
    func addConstraints(for attributes: [AdaptiveAttribute], constraints: [NSLayoutConstraint]) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addConstraints(for: traitCollection, constraints: constraints)
    }
    
    func addConstraints(for attribute: AdaptiveAttribute, constraints: NSLayoutConstraint...) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addConstraints(for: traitCollection, constraints: constraints)
    }
    
    func addView(for traitCollection: UITraitCollection, view: UIView, parent: UIView, constraints: [Constraint]) {

        parent.addSubview(view)
        
        let viewContainer = AdaptiveViewContainer(traitCollection: traitCollection, parent: parent, child: view)
        adaptiveElements.append(viewContainer)
        
        let constructedConstraints = constraints.map { $0(view, parent) }
        
        if constructedConstraints.isEmpty == false {
            let constraintContainer = AdaptiveConstraintContainer(traitCollection: traitCollection, constraints: constructedConstraints)
            adaptiveElements.append(constraintContainer)
        }
    }
    
    func addView(for attributes: [AdaptiveAttribute], view: UIView, parent: UIView, constraints: [Constraint] = []) {
        let traitCollection = UITraitCollection.create(with: attributes)
        addView(for: traitCollection, view: view, parent: parent, constraints: constraints)
    }
    
    func addView(for attribute: AdaptiveAttribute, view: UIView, parent: UIView, constraints: [Constraint] = []) {
        let traitCollection = UITraitCollection.create(with: [attribute])
        addView(for: traitCollection, view: view, parent: parent, constraints: constraints)
    }
}
