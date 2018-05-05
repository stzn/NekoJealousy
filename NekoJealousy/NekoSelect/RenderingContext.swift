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
