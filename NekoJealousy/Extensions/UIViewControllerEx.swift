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

extension UIViewController {
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

