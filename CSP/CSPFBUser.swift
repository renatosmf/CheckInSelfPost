//
//  CSPFBUser.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation


class CSPFBUser: NSObject, NSCoding {
    
    var id : Int?
    var name : String?
    var email : String?
    var gender : String?
    var age : Int?
    var picture : CSPFBPictureProfile?
    var cover : CSPFBCoverPicture?
    var tokenSession : CSPFBTokenSession?
    
    
    
    public func encode(with aCoder: NSCoder) {
            aCoder.encode(id, forKey: "id")
            aCoder.encode(name, forKey: "name")
            aCoder.encode(email, forKey: "email")
            aCoder.encode(gender, forKey: "gender")
            aCoder.encode(age, forKey: "age")
            aCoder.encode(picture, forKey: "picture")
            aCoder.encode(cover, forKey: "cover")
            aCoder.encode(tokenSession, forKey: "tokenSession")
    }
    

    required init(coder aDecoder: NSCoder) {
        
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey:"name") as? String
        email = aDecoder.decodeObject(forKey:"email") as? String
        gender = aDecoder.decodeObject(forKey:"gender") as? String
        age = aDecoder.decodeObject(forKey:"age") as? Int
        picture = aDecoder.decodeObject(forKey: "picture") as? CSPFBPictureProfile
        cover = aDecoder.decodeObject(forKey: "cover") as? CSPFBCoverPicture
        tokenSession = aDecoder.decodeObject(forKey: "tokenSession") as? CSPFBTokenSession
    }
    
    override init(){
        
    }
 
    convenience init(json: [String:AnyObject]) {
        
        self.init()

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
            self.picture = CSPFBPictureProfile.init(jsonDic: g as! Dictionary<String, AnyObject>)
        }
        if let h = json["cover"] {
            self.cover = CSPFBCoverPicture.init(jsonDic: h as! Dictionary<String, AnyObject>)
        }
        
        self.tokenSession = CSPFBTokenSession.init()
    }
    
    
    
}
