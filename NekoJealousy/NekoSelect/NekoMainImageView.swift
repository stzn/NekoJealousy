//
//  NekoSelectView.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/08.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoMainImageView: UIView {

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "noimage")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.height(constant: UIScreen.main.bounds.width * 0.8)
        iv.aspecRatio(multiplier: 1)
        return iv
    }()
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.text = "未選択"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    let detailLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.text = "猫を選択してください"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 1
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let button: UIButton = {
        let b = UIButton()
        b.backgroundColor = .blue
        b.setTitle("愛でる", for: .normal)
        b.setTitle("にゃー", for: .highlighted)
        b.setTitle("猫選べ", for: .disabled)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.width(constant: UIScreen.main.bounds.width * 0.6)
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

    private func setup() {
        
        stackView.addArrangedSubview(imageView)
        stackView.setCustomSpacing(12, after: imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        stackView.setCustomSpacing(12, after: detailLabel)
        stackView.addArrangedSubview(button)
        
        self.addSubview(stackView)
        stackView.fill(parent: self)
        
        translatesAutoresizingMaskIntoConstraints = false
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
