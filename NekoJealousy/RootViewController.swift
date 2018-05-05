//
//  NekoSelectController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

protocol RootViewController {
    func add(_ childViewController: UIViewController, layout: [NSLayoutConstraint]?)
    func remove(_ childViewController: UIViewController)
}

extension RootViewController where Self: UIViewController {
    
    func add(_ childViewController: UIViewController, layout: [NSLayoutConstraint]?) {
        
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        if let layout = layout {
            
            NSLayoutConstraint.activate(layout)
            
        } else {
            
            childViewController.view.fill(parent: view)
            
        }
        childViewController.didMove(toParentViewController: self)
    }
    
    func remove(_ childViewController: UIViewController) {
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
    }
}


