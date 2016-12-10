//
//  CSPAlertHelper.swift
//  CSP
//
//  Created by Renato Machado Filho on 12/10/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit

class CSPAlertHelper: NSObject {

    class func alertWithTile(title: String, message: String, buttons: Array<(buttonName: String,function:(()->())?)>, viewController: UIViewController){
    
    let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
    
        for b in buttons {
        
            alert.addAction(UIAlertAction.init(title: b.buttonName, style: .cancel, handler: { (_) in
                
                if b.function != nil {
                    b.function!()
                
                }            
            }))
        }
    
    viewController.present(alert, animated: true, completion: nil)
    
    }
}
