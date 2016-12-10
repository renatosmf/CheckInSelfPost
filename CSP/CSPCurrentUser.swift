//
//  CSPCurrentUser.swift
//  CSP
//
//  Created by Renato Machado on 11/5/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation


class CSPCurrentUser {
    
    
    static let sharedInstance : CSPCurrentUser = {
        let instance = CSPCurrentUser(user: CSPFBUser())
        return instance
    }()
    
    //MARK: Local Variable
    
    var user : CSPFBUser?
    
    //MARK: Init
    
    init( user : CSPFBUser) {
        self.user = user
    }
    
    static func initInstanceWithUser(user: CSPFBUser) {
        CSPCurrentUser.sharedInstance.user = user
    }
    
    func cleanUser() {
        user = nil
    }
    
}
