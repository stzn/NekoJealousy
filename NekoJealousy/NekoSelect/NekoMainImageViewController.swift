//
//  NekoMainImageViewController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/02.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoMainImageViewController: UIViewController {
    
    let baseView: NekoMainImageView
    
    init() {
        baseView = NekoMainImageView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
       
        self.view.addSubview(baseView, constraints: fill())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNekoInfo(info: NekoInfo?) {
        baseView.setNekoInfo(info: info)
    }
    
    func setAdmireTapped(_ target: TargetAction) {
        baseView.setAdmireButtonAction(target)
    }
}
