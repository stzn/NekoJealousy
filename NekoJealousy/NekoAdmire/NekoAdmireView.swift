//
//  NekoAdmireView.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/08.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoAdmireView: UIView, AdaptiveInterface {
    var adaptiveElements: [AdaptiveElement] = []
    

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 1
        return sv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "noimage")
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    let modeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "question")
        return iv
    }()
    
    let label: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.text = "なでて"
        return l
    }()

    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(info: NekoInfo) {
        self.init(frame: .zero)
        setup(info: info)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        update(for: traitCollection)
    }
    
    private func setup(info: NekoInfo) {
        
        stackView.addArrangedSubview(label)
        stackView.setCustomSpacing(20, after: label)
        if let name = info.imageName {
            imageView.image = UIImage(named: name)
        }
        
        imageView.addSubview(modeImageView, constraints: [
                equal(\.topAnchor, constant: 12),
                equal(\.rightAnchor, constant: 0),
                equal(\.heightAnchor, constant: 80),
                aspectRatio(\.heightAnchor, \.widthAnchor, multiplier: 1)
        ])
        
        stackView.addArrangedSubview(imageView, constraints: [
            equal(\.widthAnchor, constant: screenSize * 0.8),
            aspectRatio(\.heightAnchor, \.widthAnchor, multiplier: 1)
        ])
        
        addSubview(stackView, constraints: [
            equal(\.centerXAnchor),
            equal(\.centerYAnchor)
        ])
        
        addBehavior(for: [SizeClass.horizontalCompact, SizeClass.verticalCompact], behavior: {
            self.stackView.axis = .horizontal
        }, counterBehavior: {
            self.stackView.axis = .vertical
        })
    }
}
