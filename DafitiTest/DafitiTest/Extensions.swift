//
//  Extensions.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 19/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let totalSpace = sectionInsets.left + sectionInsets.right + (minimumInteritemSpacing * CGFloat(itensPerRow + 1))
        let size = Int((collectionView.bounds.width - (totalSpace + 0)) / CGFloat(itensPerRow))
        let teste = Int(Double(size) * 1.73)
        return CGSize(width: size, height: teste)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
