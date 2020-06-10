//
//  Setup2ViewController.swift
//  Example
//
//  Created by 郭景豪 on 2020/6/11.
//  Copyright © 2020 Tank. All rights reserved.
//

import UIKit

class Setup2ViewController: UIViewController {

    private let label : UILabel = {
        let label = UILabel()
        label.text = "TL"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .black
        label.backgroundColor = .cyan
        return label
    }()
    
    private let label2 : UILabel = {
        let label = UILabel()
        label.text = "BRSafe"
        label.font = UIFont.systemFont(ofSize: 50)
        label.textColor = .black
        label.backgroundColor = .cyan
        return label
    }()
    
    private let label3 : UILabel = {
        let label = UILabel()
        label.text = "BL Padding left"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .cyan
        return label
    }()
    
    private let label4 : UILabel = {
        let label = UILabel()
        label.text = "TR Control size"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.backgroundColor = .cyan
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.anchor(top: view.topAnchor, leading: view.leadingAnchor)
        
        view.addSubview(label2)
        label2.anchor(bottom: view.safeArea.bottomAnchor, trailing: view.trailingAnchor)
        
        view.addSubview(label3)
        label3.anchor(leading: view.leadingAnchor ,bottom: view.safeArea.bottomAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        
        view.addSubview(label4)
        label4.anchor(top: view.topAnchor, trailing: view.trailingAnchor, size: .init(width: 150, height: 80))
        
    }
    

}
