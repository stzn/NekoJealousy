//
//  UIViewControllerEx.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/04.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

extension UIViewController {
    static var name: String {
        get {
            return String(describing: self)
        }
    }
}

