//
//  CSPLoading.swift
//  CSP
//
//  Created by Renato Machado on 11/5/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit

class CSPLoading: UIView {
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    static var vLoading : CSPLoading! = nil
    
    static func showLoading()
    {
        let win = UIApplication.shared.delegate?.window
        
        if (vLoading == nil)
        {
            vLoading = Bundle.main.loadNibNamed("CSPLoading", owner: nil, options: nil)?[0] as! CSPLoading
            vLoading.frame = win!!.bounds
            
        }
        
        vLoading.activityIndicatorView.startAnimating()
        win!!.addSubview(vLoading)
        
    }
    
    static func hideLoading()
    {
        if vLoading != nil {
            vLoading.activityIndicatorView.stopAnimating()
            vLoading.removeFromSuperview()
        }
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
