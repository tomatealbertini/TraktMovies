//
//  Extensions.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 19/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    //1
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        //2
        let paddingSpace = sectionInsets.left * (itensPerRow)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itensPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
