//
//  CollectionViewGridLayout.swift
//  CollectionViewTwoStraws
//
//  Created by Suhaib AlMutawakel on 7/19/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit

class CollectionViewGridLayout : UICollectionViewFlowLayout
{
    var numberofItemsPerRow: Int = 2 {
        didSet {
            invalidateLayout()
        }
    }
    
    override func prepare() {
        super.prepare()
        
        if let collectionView = self.collectionView {
        var newItemSize = itemSize
        let itemsPerRow = CGFloat(max(numberofItemsPerRow,1))
        
        let totalSpacing = minimumInteritemSpacing * (itemsPerRow - 1) + sectionInset.left + sectionInset.right
        
            newItemSize.width = (collectionView.bounds.size.width - totalSpacing)/itemsPerRow
        
            if itemSize.height > 0 {
                let itemAspectRatio = itemSize.width / itemSize.height
                newItemSize.height = newItemSize.width / itemAspectRatio
            }
            
            itemSize = newItemSize
        }
        
    }
    
}
