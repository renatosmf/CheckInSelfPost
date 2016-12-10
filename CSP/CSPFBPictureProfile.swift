//
//  CSPFBPictureProfile.swift
//  CSP
//
//  Created by Renato Machado on 11/2/16.
//  Copyright © 2016 Renato Machado. All rights reserved.
//

import Foundation
import UIKit

class CSPFBPictureProfile : NSObject, NSCoding {
    
        var height : Int?
        var width : Int?
        var url : String?
        var imgProfile : UIImage?
    
    
    override init() {
    }
    
    convenience init(jsonDic: Dictionary<String,AnyObject>){
        
        self.init()
        
        if let a = (jsonDic["data"] as? Dictionary<String,AnyObject>)?["height"] {
            
            self.height = a as? Int
        }
        
        if let b = (jsonDic["data"] as? Dictionary<String,AnyObject>)?["width"] {
            
            self.width = b as? Int
        }
        
        if let c = (jsonDic["data"] as? Dictionary<String,AnyObject>)?["url"] {
            
            self.url = c as? String
            
            let u = URL(string: self.url!)
            
            do {
                let imgData = try Data.init(contentsOf: u!)
                self.imgProfile = UIImage(data: imgData)
            }catch let error {
                NSLog("Error Dowload profile img: \(error)")
            }
        }
    }
    
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.height, forKey: "height")
        aCoder.encode(self.width, forKey: "width")
        aCoder.encode(self.url, forKey: "url")
        aCoder.encode(UIImagePNGRepresentation(self.imgProfile!), forKey: "imgProfile")
    }
    
    
    required init(coder aDecoder: NSCoder) {
        
        self.height = aDecoder.decodeObject(forKey: "height") as? Int
        self.width = aDecoder.decodeObject(forKey:"width") as? Int
        self.url = aDecoder.decodeObject(forKey:"url") as? String
        self.imgProfile = UIImage.init(data: aDecoder.decodeObject(forKey:"imgProfile") as! Data)
    }

}
