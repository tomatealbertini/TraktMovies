//
//  BaseViewController.swift
//  DafitiTest
//
//  Created by Tomate Albertini on 22/08/17.
//  Copyright © 2017 dafiti. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)

     let activityIndicatorViewTag = 9874
     let activityIndicatorOverlayViewTag = 4789
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubview(toFront: view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showActivityIndicator(view: UIView, withOpaqueOverlay: Bool) {
        
        // this will be the alignment view for the activity indicator
        var superView: UIView = view
        
        // if we want an opaque overlay, do that work first then put the activity indicator within that view; else just use the passed UIView to center it
        if withOpaqueOverlay {
            
            let overlay = UIView()
            overlay.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
            overlay.layer.backgroundColor = UIColor.black.cgColor
            overlay.alpha = 0.7
            overlay.tag = activityIndicatorOverlayViewTag
            
            overlay.center = superView.center
            overlay.isHidden = false
            superView.addSubview(overlay)
            superView.bringSubview(toFront: overlay)
            
            // now we'll work on adding the indicator to the overlay (now superView)
            superView = overlay
        }
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        indicator.center = superView.center
        indicator.tag = activityIndicatorViewTag
        indicator.isHidden = false
        
        superView.addSubview(indicator)
        superView.bringSubview(toFront: indicator)
        
        indicator.startAnimating()
        
        // also indicate network activity in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideActivityIndicator(view: UIView) {
        
        // stop the network activity animation in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        // remove the activity indicator and optional overlay views
        view.viewWithTag(activityIndicatorViewTag)?.removeFromSuperview()
        view.viewWithTag(activityIndicatorOverlayViewTag)?.removeFromSuperview()
    }
    
    
}
