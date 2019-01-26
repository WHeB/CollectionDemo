//
//  FallsLayout.swift
//  CollectionViewDemo
//
//  Created by admin on 2019/1/26.
//  Copyright © 2019年 wangpeng. All rights reserved.
//

import UIKit

class FallsLayout: UICollectionViewFlowLayout {
    
    var itemCount: Int?
    var attributesArray: Array<UICollectionViewLayoutAttributes>?
    
    override func prepare() {
        super.prepare()
        
        attributesArray = Array<UICollectionViewLayoutAttributes>()
        // 设置两列 计算每个item的宽度
        let WIDTH = (UIScreen.main.bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing) / 2
        // 定义数组保存每一列的高度
        // 这个数组主要保存每一列的总高度，这样在布局是可以始终将下一个item放在最短的列下面
        var colHeight = Array<CGFloat>()
        colHeight.append(self.sectionInset.top)
        colHeight.append(self.sectionInset.top)
        // itemCount 是外界传进来的item的个数，便利设置每一个item的布局
        for index in 0..<itemCount! {
            let indexPath = IndexPath.init(item: index, section: 0)
            // 创建一个布局属性类
            let attris = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
            // 随机高度 在 200 - 300 之间
            let height = arc4random()%100 + 200
            // 哪一列高度小，就放到那一列下面
            // 标记那一列最短
            var width = 0
            if colHeight[0] < colHeight[1] {
                colHeight[0] = colHeight[0] + CGFloat(height) + self.minimumLineSpacing
                width = 0
            }else {
                colHeight[1] = colHeight[1] + CGFloat(height) + self.minimumLineSpacing
                width = 1
            }
            // 设置item的位置
            attris.frame = CGRect.init(x: self.sectionInset.left + (self.minimumLineSpacing + WIDTH) * CGFloat(width), y: colHeight[width] - CGFloat(height) - self.minimumLineSpacing, width: WIDTH, height: CGFloat(height))
            attributesArray?.append(attris)
        }
        
        // 设置itemSize以确保滑动范围正确，这里是通过将所有的item高度平均化计算出来的（以最高的列为标准）
        if colHeight[0] > colHeight[1] {
            self.itemSize = CGSize.init(width: WIDTH, height: (colHeight[0] - self.sectionInset.top) * 2 / CGFloat(itemCount!) - self.minimumLineSpacing)
        }else {
            self.itemSize = CGSize.init(width: WIDTH, height: (colHeight[1] - self.sectionInset.top) * 2 / CGFloat(itemCount!) - self.minimumLineSpacing)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesArray!
    }
}
