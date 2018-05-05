//
//  NekoSelectViewController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

protocol ViewState {}

final class NekoSelectViewController: UIViewController, RootViewController {
    
    struct ViewState {
        var selectedIndexPath: IndexPath?
        var info: NekoInfo?        
    }
        
    var state: ViewState = ViewState(selectedIndexPath: nil, info: nil) {
        didSet {
            for u in updates {
                u(state)
            }
        }
    }
    
    var updates = [(ViewState) -> ()]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadInfo() -> [NekoInfo]? {
        
        if let url = Bundle.main.url(forResource: "NekosInfo", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode([NekoInfo].self, from: data)
            } catch {
                print("error:\(error)")
                return nil
            }
        }
        return nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let items = loadInfo() ?? []
        let model = NekoThumbnailViewModel(items: items)
        model.delegate = self
        let collectionVC = NekoThumbnailCollectionViewController(model: model)
        let mainImageVC = NekoMainImageViewController()
        
        add(collectionVC,
            layout: [
                collectionVC.view.leftConstraint(to: self.view, constant: 12),
                collectionVC.view.rightConstraint(to: self.view, constant: -12),
                collectionVC.view.topConstraint(to: self.view, constant: 12),
                collectionVC.view.heightConstraint(constant: 200)
            ])
        
        add(mainImageVC,
            layout: [
                mainImageVC.view.leftConstraint(to: self.view, constant: 12),
                mainImageVC.view.rightConstraint(to: self.view, constant: -12),
                mainImageVC.view.topConstraintBottom(to: collectionVC.view, constant: 12),
                mainImageVC.view.heightConstraint(constant: 400),
                ])

        updates += collectionVC.buildUpdates()
        updates += mainImageVC.buildUpdates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension NekoSelectViewController: NekoThumbnailViewModelDelegate {
    func imageSelected(indexPath: IndexPath, info: NekoInfo) {
        state = ViewState(selectedIndexPath: indexPath, info: info)
    }
}

