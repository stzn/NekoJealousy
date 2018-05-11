//
//  NekoSelectViewController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

protocol ViewState {}

struct NekoSelectState {
    var selectedIndexPath: IndexPath?
    var info: NekoInfo?
}

final class NekoSelectViewController: UIViewController, RootViewController {
    
    var state = NekoSelectState(selectedIndexPath: nil, info: nil) {
        didSet {
            for u in observer.updates {
                u(state)
            }
        }
    }
    
    var observer: Observer<NekoSelectState> = Observer(strongReferences: [], updates: [])
    
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
        
        let context = RenderingContext(state: state, change: { [unowned self] f in
            f(&self.state)
        }, pushViewController: { [unowned self] vc in
            self.navigationController?.pushViewController(vc, animated: true)}  ,
        popViewController: {
            self.navigationController?.popViewController(animated: true)
        })
        let items = loadInfo() ?? []
        
        let collectionVC = NekoThumbnailCollectionViewController(items: items)

        collectionVC.didSelect = { i in
            context.change { s in
                s.selectedIndexPath = i
                s.info = items[i.row]
            }
        }
        observer.updates.append({ s in collectionVC.imageSelected(indexPath: s.selectedIndexPath)})
        
        let mainImageVC = NekoMainImageViewController()
        let admireTapped = TargetAction { [unowned self] in 
            
            guard let info = self.state.info else { return }
            
            let vc = NekoAdmireViewController(info: info)
            context.pushViewController(vc)
        }
        mainImageVC.setAdmireTapped(admireTapped)
        
        observer.strongReferences.append(admireTapped)
        
        observer.updates.append({ s in mainImageVC.setNekoInfo(info: s.info) })
        
        add(collectionVC, layout: [
            equal(\.leftAnchor, constant: 12),
            equal(\.safeAreaLayoutGuide.topAnchor, constant: 12),
            equal(\.rightAnchor, constant: -12),
            equal(\.heightAnchor, constant: UIScreen.main.bounds.size.height * 0.2)
        ])
        
        add(mainImageVC, layout: [
            equal(\.leftAnchor, constant: 12),
            equal(\.rightAnchor, constant: -12),
            equal(\.topAnchor, \.bottomAnchor, mainImageVC.view, collectionVC.view, constant: 12),
            equal(\.safeAreaLayoutGuide.bottomAnchor, constant: -12)
        ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
