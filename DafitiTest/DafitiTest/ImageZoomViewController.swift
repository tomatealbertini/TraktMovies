//
//  ImageZoomViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 21/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class ImageZoomViewController: BaseViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var btClose: UIButton!
    
    var imageFromDetails:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scroll.minimumZoomScale = 1.0
        self.scroll.maximumZoomScale = 6.0
        
        self.imageView.image = imageFromDetails
        
        self.btClose.changeButtonImageColor(to: UIColor.white)
       
    }


    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    @IBAction func close(sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
