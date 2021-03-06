//
//  ViewController.swift
//  Example
//
//  Created by 郭景豪 on 2020/6/10.
//  Copyright © 2020 Tank. All rights reserved.
//

import UIKit

struct VCModel {
    let vc: UIViewController
    let title: String
}

class ViewController: UITableViewController {

    let data: [VCModel] = [
        VCModel(vc: Setup1ViewController(nibName: nil, bundle: nil), title: "fill superview"),
        VCModel(vc: Setup2ViewController(nibName: nil, bundle: nil), title: "anchor"),
        VCModel(vc: Setup3ViewController(nibName: nil, bundle: nil), title: "center"),
        VCModel(vc: Setup4ViewController(nibName: nil, bundle: nil), title: "alignment")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(data[indexPath.row].vc, animated: true, completion: nil)
    }

}

