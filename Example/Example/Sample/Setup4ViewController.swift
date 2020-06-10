//
//  Setup4ViewController.swift
//  Example
//
//  Created by 郭景豪 on 2020/6/11.
//  Copyright © 2020 Tank. All rights reserved.
//

import UIKit

class Setup4ViewController: UIViewController {

    private let label1 : UILabel = {
        let label = UILabel()
        label.text = "Center"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .cyan
        return label
    }()
    
    private let label2 : UILabel = {
        let label = UILabel()
        label.text = "trailing"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .brown
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label1)
        label1.centerInSuperview(size: .init(width: 100, height: 100))
        
        view.addSubview(label2)
        label2.anchor(top: label1.topAnchor, leading: label1.trailingAnchor, bottom: label2.bottomAnchor)
    }
    

}
