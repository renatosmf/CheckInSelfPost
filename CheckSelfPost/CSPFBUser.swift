//
//  CSPFBUser.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation


class CSPFBUser: NSObject {
    
    var id : Int?
    var name : String?
    var email : String?
    var gender : String?
    var age : Int?
    var picture : CSPFBPictureProfile?
    var cover : CSPFBCoverPicture?
    
   
   static func parseObj(json: [String:AnyObject]) -> CSPFBUser {
    
        let user = CSPFBUser()
    
        if let a = json["id"] as? String{
            user.id = Int(a)
        }
        if let b = json["name"]{
            user.name = b as? String
        }
        if let c = json["email"]{
            user.email = c as? String
        }
        if let d = json["gender"]{
            user.gender = d as? String
        }
        if let f = (json["age_range"] as! [String:AnyObject])["min"]{
            user.age = f as? Int
        }
        if let g = json["picture"]{
            user.picture = CSPFBPictureProfile.makeFromDictionaryToObject(jsonDic: g as! Dictionary<String, AnyObject>)
        }
        if let h = json["cover"] {
            user.cover = CSPFBCoverPicture().makeFromDictionaryToObject(jsonDic: h as! Dictionary<String, AnyObject>)
        }
    
        return user
    }
    
    
    
}
