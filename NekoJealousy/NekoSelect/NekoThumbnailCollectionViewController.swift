//
//  NekoThumbnailCollectionViewController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoThumbnailCollectionViewController: UIViewController {

    var didSelect: ((IndexPath) -> ())? = nil
    
    let items: [NekoInfo]
    init(items: [NekoInfo]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let  collectionView = NekoThumbnailCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.view.addSubview(collectionView, constraints: fill())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imageSelected(indexPath: IndexPath?) {
        
        collectionView.setSelectedCell(indexPath: indexPath)
    }
}

extension NekoThumbnailCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.collectionView.setCell(indexPath: indexPath, info: items[indexPath.row])
    }
}

extension NekoThumbnailCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelect?(indexPath)
    }
}

extension NekoThumbnailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.collectionView.getItemSize()
    }
    
}
