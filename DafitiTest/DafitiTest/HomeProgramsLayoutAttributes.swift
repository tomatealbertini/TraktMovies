//
//  Ids.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 18/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class HomeProgramsLayoutAttributes: UICollectionViewLayoutAttributes
{
    @objc var lineSpacing:CGFloat = 0.0

    func copyWithZone(zone: NSZone) -> AnyObject
    {
        let copiedAttributes: HomeProgramsLayoutAttributes = copyWithZone(zone: zone) as! HomeProgramsLayoutAttributes
        copiedAttributes.lineSpacing = self.lineSpacing
        return copiedAttributes
    }
    
    func isEqual(object: AnyObject?) -> Bool
    {
        return super.isEqual(object) && self.lineSpacing == object?.lineSpacing
    }
}
