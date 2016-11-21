//
//  CSPFBTokenSession.swift
//  CSP
//
//  Created by Renato Machado on 11/21/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class CSPFBTokenSession: NSObject {

    var tokenString : String?
    var userID : String?
    var expirationDate : Date?
    var refreshDate : Date?
    
    override init() {
        self.tokenString = FBSDKAccessToken.current().tokenString
        self.userID = FBSDKAccessToken.current().appID
        self.expirationDate = FBSDKAccessToken.current().expirationDate
        self.refreshDate = FBSDKAccessToken.current().refreshDate
        
    }
}
