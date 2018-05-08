//
//  NekoAdmireView.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/08.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoAdmireView: UIView {

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 1
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "noimage")
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.aspecRatio(multiplier: 1)
        return iv
    }()
    
    let modeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "question")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.anchor(\UIView.heightAnchor , constant: 80)
        iv.aspecRatio(multiplier: 1)
        return iv
    }()
    
    let label: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.text = "こすって"
        l.translatesAutoresizingMaskIntoConstraints = false
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
    
    
    private func setup(info: NekoInfo) {
        
        stackView.addArrangedSubview(label)
        stackView.setCustomSpacing(20, after: label)
        if let name = info.imageName {
            imageView.image = UIImage(named: name)
        }
        
        imageView.addSubview(modeImageView)
        NSLayoutConstraint.activate(modeImageView.constraintArray(to: imageView, left: nil, top: 12, right: 0, bottom: nil))
        
        stackView.addArrangedSubview(imageView)
        addSubview(stackView)
        
        var constraints = stackView.constraintArray(to: self, left: 12, top: nil, right: 0, bottom: nil)
        constraints.append(stackView.anchorLayout(\UIView.centerYAnchor, to: self))
        NSLayoutConstraint.activate(constraints)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
