//
//  RenderingContext.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/05.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

struct RenderingContext<State> {
    let state: State
    let change: ((inout State)->()) -> ()
    let pushViewController: (UIViewController) -> ()
    let popViewController: () -> ()
}

final class TargetAction {
    
    let execute: () -> ()
    init(_ execute: @escaping () -> ()) {
        self.execute = execute
    }
    @objc func action(_ sender: Any) {
        execute()
    }
}

struct Observer<State> {
    var strongReferences: [Any]
    var updates: [(State) -> ()]
}
