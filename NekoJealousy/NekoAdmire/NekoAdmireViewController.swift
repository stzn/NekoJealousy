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
    let baseView: NekoAdmireView
    
    init(info: NekoInfo) {
        self.info = info
        baseView = NekoAdmireView(info: info)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var angerTimer: Timer?
    var happyTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(baseView, constraints: fill())
        
        setAngerTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setHappyTimer()
        angerTimer?.invalidate()
        baseView.modeImageView.image = #imageLiteral(resourceName: "question")
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
            s.baseView.modeImageView.image = #imageLiteral(resourceName: "anger")
            s.angerTimer?.invalidate()
        }
    }

    private func setHappyTimer() {
        happyTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { [weak self] _ in
            guard let s = self else { return }
            s.baseView.modeImageView.image = #imageLiteral(resourceName: "happy")
            s.happyTimer?.invalidate()
        }
    }

}


