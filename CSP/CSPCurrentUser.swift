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
    var token : CSPFBTokenSession?
    
    //MARK: Init
    
    init( user : CSPFBUser) {
        self.user = user
        self.token = CSPFBTokenSession.init()
    }
    
    static func initInstanceWithUser(user: CSPFBUser) {
        CSPCurrentUser.sharedInstance.user = user
        CSPCurrentUser.sharedInstance.token = CSPFBTokenSession.init()
    }
    
    func cleanUser() {
        user = nil
        token = nil
    }
    
}
