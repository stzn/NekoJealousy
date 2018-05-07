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
        iv.height(constant: UIScreen.main.bounds.width * 0.8)
        iv.aspecRatio(multiplier: 1)
        return iv
    }()
    
    let modeImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "question")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.height(constant: 80)
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
        modeImageView.right(to: imageView, constant: 12).top(to: imageView, constant: 12)
        
        stackView.addArrangedSubview(imageView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftConstraint(to: self, constant: 12),
            stackView.rightConstraint(to: self, constant: -12),
            stackView.centerYConstraint(to: self),
            ])
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
