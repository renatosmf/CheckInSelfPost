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
    
    
    required init(coder aDecoder: NSCoder) {
        if let a = aDecoder.decodeCInt(forKey:"id") as? Int {
            self.id = a
        }
        
        if let b = aDecoder.decodeObject(forKey:"name") as? String {
            self.name = b
        }
        
        if let c = aDecoder.decodeObject(forKey:"email") as? String {
            self.email = c
        }
        
        if let d = aDecoder.decodeObject(forKey:"gender") as? String {
            self.gender = d
        }
        
        if let e = aDecoder.decodeCInt(forKey:"age") as? Int {
            self.age = e
        }
        
        if let f = aDecoder.decodeObject(of: CSPFBPictureProfile, forKey: "picture") as? CSPFBPictureProfile {
            self.picture = f
        }
        
        if let g = aDecoder.decodeObject(of: CSPFBCoverPicture, forKey: "cover") as? CSPFBCoverPicture {
            self.cover = g
        }
        
        if let h = aDecoder.decodeObject(of: CSPFBTokenSession, forKey: "tokenSession") as? CSPFBTokenSession {
            self.tokenSession = h
        }
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let a = self.id {
            aCoder.encode(a, forKey: "id")
        }
        
        if let b = self.name {
            aCoder.encode(b, forKey: "name")
        }
        
        if let c = self.email {
            aCoder.encode(c, forKey: "email")
        }
        
        if let d = self.gender {
            aCoder.encode(d, forKey: "gender")
        }
        
        if let e = self.age {
            aCoder.encode(e, forKey: "age")
        }
        
        if let f = self.picture {
            aCoder.encode(f, forKey: "picture")
        }
        
        if let g = self.cover {
            aCoder.encode(g, forKey: "cover")
        }
        
        if let h = self.tokenSession {
            aCoder.encode(h, forKey: "tokenSession")
        }
    }
    
   
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
