//
//  RootCoordinator.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

protocol RootViewControllerProvider: class {
    var rootViewController: UIViewController  { get }
}

typealias RootCoordinator = Coordinator & RootViewControllerProvider
