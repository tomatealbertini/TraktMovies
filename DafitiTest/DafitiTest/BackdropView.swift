//
//  Backdrop.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 21/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class BackdropView: UIView {

    @IBOutlet weak var imgBackdrop:UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("BackdropView", owner: self, options: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //custom logic goes here
    }

}
