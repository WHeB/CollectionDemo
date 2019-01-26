//
//  SudokuViewController.swift
//  CollectionViewDemo
//  九宫格
//  Created by admin on 2019/1/6.
//  Copyright © 2019年 wangpeng. All rights reserved.
//

import UIKit

class SudokuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.collectionView)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize.init(width: (ScreenW - 40) / 3, height: (ScreenW - 40) / 3)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 0.0
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
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
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = UIColor.init().arc4randomaColor()
        return cell
    }
}



