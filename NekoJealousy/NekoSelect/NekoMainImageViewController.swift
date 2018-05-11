//
//  NekoMainImageViewController.swift
//  NekoJealousy
//
//  Created by stakata on 2018/05/02.
//  Copyright © 2018年 sztk. All rights reserved.
//

import UIKit

final class NekoMainImageViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        self.view = NekoMainImageView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setNekoInfo(info: NekoInfo?) {
        (view as? NekoMainImageView)?.setNekoInfo(info: info)
    }
    
    func setAdmireTapped(_ target: TargetAction) {
        (view as? NekoMainImageView)?.setAdmireButtonAction(target)
    }
}
