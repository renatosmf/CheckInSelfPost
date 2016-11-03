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
    
    init(json: [String:AnyObject]) {
        super.init()
        
        if let a = json["id"] as? String{
            self.id = Int(a)
        }
        if let b = json["name"]{
            self.name = b as? String
        }
        if let c = json["email"]{
            self.email = c as? String
        }
        if let d = json["gender"]{
            self.gender = d as? String
        }
        if let f = (json["age_range"] as! [String:AnyObject])["min"]{
            self.age = f as? Int
        }
        if let g = json["picture"]{
            self.picture = CSPFBPictureProfile.makeFromDictionaryToObject(jsonDic: g as! Dictionary<String, AnyObject>)
        }
        if let h = json["cover"] {
            self.cover = CSPFBCoverPicture().makeFromDictionaryToObject(jsonDic: h as! Dictionary<String, AnyObject>)
        }
    }
    
    
    
}
