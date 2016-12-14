//
//  CSPGuest.swift
//  CSP
//
//  Created by Renato Machado on 12/14/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import UIKit

class CSPGuest: NSObject {
    
    var name : String!
    var isChecked : Bool! = false
    var fbID : String?
    var qrCodeID : String!
    
    
    init(name n: String!, invitedChecked isChecked: Bool? = false, fbID facebookID: String?, QrCode codeString: String!) {
        self.name = n
        self.isChecked = isChecked
        self.fbID = facebookID
        self.qrCodeID = codeString
    }
    

}
