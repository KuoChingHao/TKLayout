//
//  Setup1ViewController.swift
//  Example
//
//  Created by 郭景豪 on 2020/6/10.
//  Copyright © 2020 Tank. All rights reserved.
//

import UIKit
import TKLayout

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
}

class Setup1ViewController: BaseViewController {

    private let customView1 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    private let customView2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    private let customView3 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customView1)
        view.addSubview(customView2)
        view.addSubview(customView3)

        customView1.fillSuperview()
        customView2.fillSuperviewSafeArea()
        customView3.fillSuperviewSafeArea(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    


}
