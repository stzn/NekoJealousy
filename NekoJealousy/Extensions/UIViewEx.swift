//
//  UIViewEx.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

extension UIView {
    
    func fill(parent: UIView) {
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: parent.leftAnchor),
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.rightAnchor.constraint(equalTo: parent.rightAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
            ])
    }
    
    @discardableResult
    func leftConstraint(to: UIView, constant: CGFloat? = nil) -> NSLayoutConstraint  {
        return self.leftAnchor.constraint(equalTo: to.leftAnchor, constant: constant ?? 0)
    }
    
    @discardableResult
    func rightConstraint(to: UIView, constant: CGFloat? = nil) -> NSLayoutConstraint  {
        return self.rightAnchor.constraint(equalTo: to.rightAnchor, constant: constant ?? 0)
        
    }
    
    @discardableResult
    func topConstraint(to: UIView, constant: CGFloat? = nil) -> NSLayoutConstraint  {
        return self.topAnchor.constraint(equalTo: to.topAnchor, constant: constant ?? 0)
    }
    
    @discardableResult
    func bottomConstraint(to: UIView, constant: CGFloat? = nil) -> NSLayoutConstraint  {
        return self.bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: constant ?? 0)
    }

    @discardableResult
    func leftConstraintRight(to: UIView, constant: CGFloat? = nil) -> NSLayoutConstraint  {
        return self.leftAnchor.constraint(equalTo: to.rightAnchor, constant: constant ?? 0)
    }

    @discardableResult
    func topConstraintBottom(to: UIView, constant: CGFloat? = nil) -> NSLayoutConstraint  {
        return self.topAnchor.constraint(equalTo: to.bottomAnchor, constant: constant ?? 0)
    }
    

    @discardableResult
    func heightConstraint(constant: CGFloat) -> NSLayoutConstraint  {
        return self.heightAnchor.constraint(equalToConstant: constant)
    }
    
    @discardableResult
    func widthConstraint(constant: CGFloat) -> NSLayoutConstraint  {
        return self.widthAnchor.constraint(equalToConstant: constant)
    }

    @discardableResult
    func centerYConstraint(to: UIView, constant: CGFloat? = nil) -> NSLayoutConstraint  {
        return self.centerYAnchor.constraint(equalTo: to.centerYAnchor, constant: constant ?? 0)
    }

    @discardableResult
    func left(to: UIView, constant: CGFloat? = nil) -> UIView  {
        self.leftAnchor.constraint(equalTo: to.leftAnchor, constant: constant ?? 0).isActive = true
        return self
    }

    @discardableResult
    func right(to: UIView, constant: CGFloat? = nil) -> UIView  {
        self.rightAnchor.constraint(equalTo: to.rightAnchor, constant: constant ?? 0).isActive = true
        return self
    }

    @discardableResult
    func top(to: UIView, constant: CGFloat? = nil) -> UIView  {
        self.topAnchor.constraint(equalTo: to.topAnchor, constant: constant ?? 0).isActive = true
        return self
    }

    @discardableResult
    func bottom(to: UIView, constant: CGFloat? = nil) -> UIView  {
        self.bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: constant ?? 0).isActive = true
        return self
    }

    @discardableResult
    func height(constant: CGFloat) -> UIView  {
        self.heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }

    @discardableResult
    func width(constant: CGFloat) -> UIView  {
        self.widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func aspecRatio(multiplier: CGFloat) -> UIView  {
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier)
        return self
    }

    
    @discardableResult
    func centerX(to: UIView, constant: CGFloat? = nil) -> UIView  {
        self.centerXAnchor.constraint(equalTo: to.centerXAnchor, constant: constant ?? 0).isActive = true
        return self
    }

    @discardableResult
    func centerY(to: UIView, constant: CGFloat? = nil) -> UIView  {
        self.centerYAnchor.constraint(equalTo: to.centerYAnchor, constant: constant ?? 0).isActive = true
        return self
    }

    func constraintArray(to: UIView,
                         left: CGFloat? = nil,
                         top: CGFloat? = nil,
                         right: CGFloat? = nil,
                         bottom: CGFloat? = nil) -> [NSLayoutConstraint] {
        return [
            self.leftAnchor.constraint(equalTo: to.leftAnchor, constant: left ?? 0),
            self.topAnchor.constraint(equalTo: to.topAnchor, constant: top ?? 0),
            self.rightAnchor.constraint(equalTo: to.rightAnchor, constant: right ?? 0),
            self.bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: bottom ?? 0)
        ]
    }
}
