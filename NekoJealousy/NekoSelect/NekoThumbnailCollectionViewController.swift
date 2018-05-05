//
//  NekoThumbnailCollectionViewController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/01.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

protocol ThumbnailDelagete {
    func nakoSelected(selectedIndex: Int)
}

private let reuseIdentifier = "Cell"

final class NekoThumbnailCollectionViewController: UIViewController {

    let model: NekoThumbnailViewModel
    var selectedIndexPath: IndexPath?
        
    init(model: NekoThumbnailViewModel) {
        self.model = model
        self.selectedIndexPath = nil
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildUpdates() -> [(NekoSelectViewController.ViewState) -> ()]{
        return [{ [unowned self] s in
            self.imageSelected(indexPath: s.selectedIndexPath)
        }]
    }
    
    let collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let size = UIScreen.main.bounds
        
        let collectionView = UICollectionView(frame: size, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = .white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.view.addSubview(collectionView)
        
        collectionView.fill(parent: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageSelected(indexPath: IndexPath?) {
        
        if let i = selectedIndexPath, let cell = collectionView.cellForItem(at: i) {
            cell.layer.borderWidth = 0
        }
        
        guard let i = indexPath, let cell = collectionView.cellForItem(at: i) else {
            return
        }
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.red.cgColor
        
        selectedIndexPath = indexPath
    }
}

extension NekoThumbnailCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if  let imageName = model.items[indexPath.row].imageName,
            let image = UIImage(named: imageName) {
            
            let imageView = UIImageView(image: image)
            cell.contentView.addSubview(imageView)
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.fill(parent: cell.contentView)
        }
        
        return cell
    }
}

extension NekoThumbnailCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        model.imageSelected(indexPath: indexPath)
    }
}
