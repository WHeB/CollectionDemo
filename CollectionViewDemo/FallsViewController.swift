//
//  FallsViewController.swift
//  CollectionViewDemo
//  瀑布流
//  Created by admin on 2019/1/6.
//  Copyright © 2019年 wangpeng. All rights reserved.
//

import UIKit

class FallsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.collectionView)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = FallsLayout.init()
        layout.itemCount = 20
        let view = UICollectionView.init(frame: self.view.bounds, collectionViewLayout:layout )
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
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = UIColor.init().arc4randomaColor()
        return cell
    }
    
}
