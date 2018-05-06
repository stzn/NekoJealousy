//
//  NekoAdmireViewController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/06.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoAdmireViewController: UIViewController, RootViewController {
    
    let info: NekoInfo
    
    init(info: NekoInfo) {
        self.info = info
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    
    var angerTimer: Timer?
    var happyTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        stackView.addArrangedSubview(label)
        stackView.setCustomSpacing(20, after: label)
        if let name = info.imageName {
            imageView.image = UIImage(named: name)
        }
        
        imageView.addSubview(modeImageView)
        modeImageView.right(to: imageView, constant: 12).top(to: imageView, constant: 12)
        
        stackView.addArrangedSubview(imageView)
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leftConstraint(to: self.view, constant: 12),
            stackView.rightConstraint(to: self.view, constant: -12),
            stackView.centerYConstraint(to: self.view),
            ])

        setAngerTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setHappyTimer()
        angerTimer?.invalidate()
        modeImageView.image = #imageLiteral(resourceName: "question")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setAngerTimer()
        happyTimer?.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setAngerTimer() {
        angerTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { [weak self] _ in
            guard let s = self else { return }
            s.modeImageView.image = #imageLiteral(resourceName: "anger")
            s.angerTimer?.invalidate()
        }
    }

    private func setHappyTimer() {
        happyTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { [weak self] _ in
            guard let s = self else { return }
            s.modeImageView.image = #imageLiteral(resourceName: "happy")
            s.happyTimer?.invalidate()
        }
    }

}


