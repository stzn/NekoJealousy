//
//  UIViewEx.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

extension UIView {
        
    func anchor<Anchor, AnchorType>(_ anchorPath: KeyPath<UIView, Anchor>,
                                    to view: UIView,
                                    constant: CGFloat = 0) where Anchor: NSLayoutAnchor<AnchorType>{
        self[keyPath: anchorPath].constraint(equalTo: view[keyPath: anchorPath], constant: constant).isActive = true
    }

    func anchor<Anchor>(_ anchorPath: KeyPath<UIView, Anchor>, constant: CGFloat) where Anchor: NSLayoutDimension {
        self[keyPath: anchorPath].constraint(equalToConstant: constant).isActive = true
    }

    func anchorLayout<Anchor, AnchorType>(_ anchorPath: KeyPath<UIView, Anchor>,
                                    to view: UIView,
                                    constant: CGFloat = 0) -> NSLayoutConstraint where Anchor: NSLayoutAnchor<AnchorType> {
        return self[keyPath: anchorPath].constraint(equalTo: view[keyPath: anchorPath], constant: constant)
    }

    func anchorLayout<Anchor, AnchorType>(view: UIView, from: KeyPath<UIView, Anchor>, to: KeyPath<UIView, Anchor>)
        -> NSLayoutConstraint where Anchor: NSLayoutAnchor<AnchorType> {
        return self[keyPath: from].constraint(equalTo: view[keyPath: to])
    }
    
    func anchorLayout<Anchor>(_ anchorPath: KeyPath<UIView, Anchor>, constant: CGFloat)
        -> NSLayoutConstraint where Anchor: NSLayoutDimension {
        return self[keyPath: anchorPath].constraint(equalToConstant: constant)
    }
    
    func fill(parent: UIView) {
        anchor(\UIView.leftAnchor, to: parent)
        anchor(\UIView.topAnchor, to: parent)
        anchor(\UIView.rightAnchor, to: parent)
        anchor(\UIView.bottomAnchor, to: parent)
    }
    
    func constraintArray(to: UIView,
                         left: CGFloat? = nil,
                         top: CGFloat? = nil,
                         right: CGFloat? = nil,
                         bottom: CGFloat? = nil) -> [NSLayoutConstraint] {
        
        var constraints: [NSLayoutConstraint] = []
        
        if let left = left {
            constraints.append(anchorLayout(\UIView.leftAnchor, to: to, constant: left))
        }

        if let top = top {
            constraints.append(anchorLayout(\UIView.topAnchor, to: to, constant: top))
        }

        if let right = right {
            constraints.append(anchorLayout(\UIView.rightAnchor, to: to, constant: right))
        }

        if let bottom = bottom {
            constraints.append(anchorLayout(\UIView.bottomAnchor, to: to, constant: bottom))
        }
        return constraints
    }

    @discardableResult
    static func <(view: UIView, subview: UIView) -> UIView {
        subview.anchor(\UIView.leadingAnchor, to: view)
        return view
    }
    
    @discardableResult
    static func ^(view: UIView, subview: UIView) -> UIView {
        subview.anchor(\UIView.topAnchor, to: view)
        return view
    }
    
    @discardableResult
    static func >(view: UIView, subview: UIView) -> UIView {
        subview.anchor(\UIView.trailingAnchor, to: view)
        return view
    }
    
    @discardableResult
    static func -(view: UIView, subview: UIView) -> UIView {
        subview.anchor(\UIView.centerYAnchor, to: view)
        return view
    }
    
    @discardableResult
    static func |(view: UIView, subview: UIView) -> UIView {
        subview.anchor(\UIView.centerXAnchor, to: view)
        return view
    }
    
    @discardableResult
    static func ==(view: UIView, subview: UIView) -> UIView {
        subview.anchor(\UIView.widthAnchor, to: view)
        return view
    }
    
    @discardableResult
    static func ||(view: UIView, subview: UIView) -> UIView {
        subview.anchor(\UIView.heightAnchor, to: view)
        return view
    }
    
    func aspecRatio(multiplier: CGFloat)  {
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier).isActive = true
    }
}
