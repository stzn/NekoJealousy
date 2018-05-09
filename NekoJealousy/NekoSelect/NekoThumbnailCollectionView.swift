//
//  NekoThumbnailCollectionView.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/08.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoThumbnailCollectionView: UICollectionView {

    private let reuseIdentifier = "Cell"
    
    var selectedIndexPath: IndexPath? = nil
    
    private override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
    }

    convenience init() {
        let l = UICollectionViewFlowLayout()
        
        l.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        l.itemSize = CGSize(width: 100, height: 100)
        l.minimumInteritemSpacing = 0
        l.minimumLineSpacing = 0
        l.scrollDirection = .horizontal
        
        self.init(frame: UIScreen.main.bounds, collectionViewLayout: l)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setCell(indexPath: IndexPath, info: NekoInfo) -> UICollectionViewCell {
        
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        if  let imageName = info.imageName,
            let image = UIImage(named: imageName) {
            
            let imageView = UIImageView(image: image)
            cell.contentView.addSubview(imageView, constraints: fill())            
        }
        return cell
    }
    
    func setSelectedCell(indexPath: IndexPath?) {
        
        if let i = selectedIndexPath, let cell = cellForItem(at: i) {
            cell.layer.borderWidth = 0
        }
        
        guard let i = indexPath, let cell = cellForItem(at: i) else {
            return
        }
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.red.cgColor
        
        selectedIndexPath = indexPath
    }
}
