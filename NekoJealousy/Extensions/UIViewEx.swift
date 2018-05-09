//
//  UIViewEx.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

typealias Constraint = (_ child: UIView, _ parent: UIView) -> NSLayoutConstraint

func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>, _ to: KeyPath<UIView, Anchor>, constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { view, parent in
        view[keyPath: keyPath].constraint(equalTo: parent[keyPath: to], constant: constant)
    }
}

func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>, _ toKeyPath: KeyPath<UIView, Anchor>, _ from: UIView, _ to: UIView, constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return { _, _ in
        from[keyPath: keyPath].constraint(equalTo: to[keyPath: toKeyPath], constant: constant)
    }
}
func equal<Axis, Anchor>(_ keyPath: KeyPath<UIView, Anchor>, constant: CGFloat = 0) -> Constraint where Anchor: NSLayoutAnchor<Axis> {
    return equal(keyPath, keyPath, constant: constant)
}

func equal<Anchor>(_ keyPath: KeyPath<UIView, Anchor>, constant: CGFloat) -> Constraint where Anchor: NSLayoutDimension {
    return { view, _ in
        view[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}

func aspectRatio<Anchor>(_ keyPath: KeyPath<UIView, Anchor>, _ to: KeyPath<UIView, Anchor>, multiplier: CGFloat) -> Constraint where Anchor: NSLayoutDimension {
    return { view, _ in
        view[keyPath: keyPath].constraint(equalTo: view[keyPath: to], multiplier: multiplier)
    }
}

func fill() -> [Constraint] {
    return [
        equal(\UIView.leftAnchor),
        equal(\UIView.topAnchor),
        equal(\UIView.rightAnchor),
        equal(\UIView.bottomAnchor)
    ]
}

extension UIView {
    func addSubview(_ child: UIView, constraints: [Constraint]) {
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
}

extension UIStackView {
    
    func addArrangedSubview(_ child: UIView, constraints: [Constraint]) {
        addArrangedSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints.map { $0(child, self) })
    }
}
