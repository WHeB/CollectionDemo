//
//  CircleViewController.swift
//  CollectionViewDemo
//  圆环布局
//  Created by admin on 2019/1/26.
//  Copyright © 2019年 wangpeng. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.collectionView)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = CircleLayout.init()
        let view = UICollectionView.init(frame: CGRect.init(x: 0, y: 100, width: ScreenW, height: ScreenW), collectionViewLayout:layout )
        view.backgroundColor = UIColor.white
        view.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "CellId")
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = UIColor.init().arc4randomaColor()
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 25
        return cell
    }
    
}
