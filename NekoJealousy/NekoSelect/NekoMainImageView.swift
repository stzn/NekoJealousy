//
//  NekoSelectView.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/08.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoMainImageView: UIView, AdaptiveInterface {
    
    var adaptiveElements: [AdaptiveElement] = []
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "noimage")
        return iv
    }()
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.text = "未選択"
        return l
    }()
    
    
    let detailLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.text = "猫を選択してください"
        return l
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 12
        return sv
    }()
    
    let button: UIButton = {
        let b = UIButton()
        b.backgroundColor = .blue
        b.setTitle("愛でる", for: .normal)
        b.setTitle("にゃー", for: .highlighted)
        b.setTitle("猫選べ", for: .disabled)
        b.layer.borderColor = UIColor.black.cgColor
        b.layer.borderWidth = 3
        b.layer.cornerRadius = 10
        b.isEnabled = false
        return b
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        update(for: traitCollection)
    }
    
    private func setup() {
        
        stackView.addArrangedSubview(imageView)
        
        addConstraints(
            for: [SizeClass.horizontalCompact, SizeClass.verticalCompact],
            constraints: equal(\.heightAnchor, constant: 0)(imageView, stackView))
        
        stackView.addArrangedSubview(titleLabel, constraints: [
            equal(\.heightAnchor, constant: titleLabel.intrinsicContentSize.height)
            ])
        
        stackView.addArrangedSubview(detailLabel, constraints: [
            equal(\.heightAnchor, constant: detailLabel.intrinsicContentSize.height)
            ])
        stackView.addArrangedSubview(button, constraints: [
            equal(\.widthAnchor, constant: screenSize * 0.6),
            equal(\.heightAnchor, constant: button.intrinsicContentSize.height)
            ])
        
        addSubview(stackView, constraints: [
            equal(\.topAnchor),
            equal(\.leftAnchor),
            equal(\.rightAnchor)
            ])
        
        addConstraints(for: [SizeClass.verticalRegular],
                       constraints: equal(\.bottomAnchor)(stackView, self))
        
        addBehavior(for: [SizeClass.verticalRegular], behavior: {
            self.button.backgroundColor = .blue
        }, counterBehavior: {
            self.button.backgroundColor = .red
        })
    }
    
    func setNekoInfo(info: NekoInfo?) {
        
        guard let info = info else {
            return
        }
        if let name = info.imageName {
            imageView.image = UIImage(named: name)
        }
        titleLabel.text = info.title
        detailLabel.text = info.detail
        button.isEnabled = true
    }
    
    func setAdmireButtonAction(_ target: TargetAction) {
        button.addTarget(target, action: #selector(TargetAction.action(_:)), for: .touchUpInside)
    }
}
