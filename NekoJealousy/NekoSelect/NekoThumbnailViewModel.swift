//
//  NekoThumbnailViewModel.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/02.
//  Copyright © 2018年 sztk. All rights reserved.
//

import Foundation

protocol NekoThumbnailViewModelDelegate: class {
    func imageSelected(indexPath: IndexPath, info: NekoInfo)
}

final class NekoThumbnailViewModel {
 
    weak var delegate: NekoThumbnailViewModelDelegate? = nil
    let items: [NekoInfo]
    init(items: [NekoInfo] ) {
        self.items = items
    }

    func imageSelected(indexPath: IndexPath) {
        let item = items[indexPath.row]
        delegate?.imageSelected(indexPath: indexPath, info: item)
    }
}
