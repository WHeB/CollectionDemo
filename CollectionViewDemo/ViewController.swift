//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by admin on 2019/1/6.
//  Copyright © 2019年 wangpeng. All rights reserved.
//

import UIKit

let ScreenW = UIScreen.main.bounds.size.width
let ScreenH = UIScreen.main.bounds.size.height

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Demo"
        self.view.addSubview(self.tableView)
    }
    
    lazy var data: [(String, UIViewController)] = {
        let array: [(String, UIViewController)] = [
            ("九宫格", SudokuViewController()),
            ("自定义布局", CustomViewController()),
            ("瀑布流", FallsViewController()),
            ("圆环布局", CircleViewController()),
        ]
        return array
    }()
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = self.data[indexPath.row].0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.data[indexPath.row].1
        vc.title = self.data[indexPath.row].0
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



public extension UIColor {
    ///  设置RGB颜色
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    /// 随机色
    func arc4randomaColor() -> UIColor {
        return UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
    }
}
