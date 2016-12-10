//
//  CSPFBTokenSession.swift
//  CSP
//
//  Created by Renato Machado on 11/21/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class CSPFBTokenSession: NSObject, NSCoding {

    var token : FBSDKAccessToken?
    
    override init() {
        self.token = FBSDKAccessToken.current()
    }
    
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(token, forKey: "token")

    }
    
    
    required init(coder aDecoder: NSCoder) {
        
        token = aDecoder.decodeObject(forKey: "token") as? FBSDKAccessToken
    }

}
