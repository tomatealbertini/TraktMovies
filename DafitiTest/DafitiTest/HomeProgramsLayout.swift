//
//  Ids.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class HomeProgramsLayout: UICollectionViewFlowLayout
{

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        let attributesToReturn = super.layoutAttributesForElements(in: rect) as! [HomeProgramsLayoutAttributes]
        
        return attributesToReturn;
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool
    {
        return true
    }
}
