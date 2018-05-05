//
//  AppCoordinator.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class AppCoordinator: RootCoordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private lazy var navigationController: UINavigationController = {
        let nv = UINavigationController()
        return nv
    }()
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    let window: UIWindow
    init(window: UIWindow) {
        self.window = window
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    
    func start() {
        navigateToNekoSelect()
    }
    
    func navigateToNekoSelect() {
        let vc = NekoSelectViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}

