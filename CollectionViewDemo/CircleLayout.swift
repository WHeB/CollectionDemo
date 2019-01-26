//
//  CircleLayout.swift
//  CollectionViewDemo
//
//  Created by admin on 2019/1/26.
//  Copyright © 2019年 wangpeng. All rights reserved.
//

import UIKit

class CircleLayout: UICollectionViewLayout {

    var itemCount: Int?
    var attributesArray: Array<UICollectionViewLayoutAttributes>?
    
    override func prepare() {
        super.prepare()
        
        attributesArray = Array<UICollectionViewLayoutAttributes>()
        // 获取items个数
        itemCount = self.collectionView?.numberOfItems(inSection: 0)
        
        // 先设定大圆的半径，取长和宽最短的
        let radius = [self.collectionView!.frame.size.width, self.collectionView!.frame.size.height].min()! / 2
        // 计算圆心位置
        let center = CGPoint.init(x: self.collectionView!.frame.size.width/2, y: self.collectionView!.frame.size.height/2)
        // 设置每个item大小为 50 X 50，半径为25
        for index in 0..<itemCount! {
            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath.init(item: index, section: 0))
            // 设置item大小
            attributes.size = CGSize.init(width: 50, height: 50)
            // 计算圆心位置
            let x = CGFloat(center.x) + cos(CGFloat(2 * Double.pi) / CGFloat(itemCount!) * CGFloat(index)) * (radius - 25)
            let y = CGFloat(center.y) + sin(CGFloat(2 * Double.pi) / CGFloat(itemCount!) * CGFloat(index)) * (radius - 25)
            attributes.center = CGPoint.init(x: x, y: y)
            attributesArray?.append(attributes)
        }
    }
    
    override var collectionViewContentSize: CGSize {
        return self.collectionView!.frame.size
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesArray!
    }
    
}
